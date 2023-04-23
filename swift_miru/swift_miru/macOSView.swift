//
//  macOSView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/23/23.
//

import SwiftUI

struct macOSView: View {
    let fileName:String
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct macOSView_Previews: PreviewProvider {
    
    static var previews: some View {
        macOSView(fileName: MyVariables.fileName)
    }
}
