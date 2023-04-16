//
//  ContentView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let fileName:String = "anime-offline-database.json"
    
    @State private var loadedOfflineMinamiDatabase: OfflineMinamiDatabase?
//    var loadedOfflineMinamiDatabase: OfflineMinamiDatabase = Bundle.main.decode("anime-offline-database.json")
    
    var body: some View {
        return NavigationStack {
            VStack {
                Text("Hello World")
                Text("Total Entries: \(loadedOfflineMinamiDatabase?.data.count ?? 0)")
                
                if loadedOfflineMinamiDatabase != nil {
                    List {
                        Text(loadedOfflineMinamiDatabase!.license.name)
                    }
                }
            }
            .toolbar {
                HStack {
                    
                    Button("Load db") {
                        loadedOfflineMinamiDatabase = Bundle.main.decode(fileName)
                        print("db is loaded")
                    }
                    Divider()
                    
                    Button("Save db") {
                        saveDbLocally()
                    }
                    Divider()
                    
                    Button("Clear db") {
                        loadedOfflineMinamiDatabase = nil
                        
                        print("db is cleared!")
                    }

                }
            }
            
        }
    }
    
    func saveDbLocally() -> Void {
        let encoder = JSONEncoder()
        
        if loadedOfflineMinamiDatabase == nil {
            print("db is non-existent")
            return
        }
        
        if let data = try? encoder.encode(loadedOfflineMinamiDatabase) {
            UserDefaults.standard.set(data, forKey: "loadedOfflineMinamiDatabase")
            
            print("Sucessfully saved!")
        }
    }
}


// Original code created when checked out Core Data and CloudKit
struct OriginalContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

