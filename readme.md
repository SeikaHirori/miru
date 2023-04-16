# Objective:
- Resolve personal issue of "o no, what anime/manga should I from my ***MAL/Anilist/Kitsu.io*** list? idk sad :'("
- LEARN WHAT AND HOW EVERYTHING WORKS :3

## Update objectives 

### (4/15/2023)
- Started migration to Swift and SwiftUI
    - Already linked up Codable to JSON for Project Minami's Offline Anime Database
<<<<<<< HEAD
    - Created View for displaying information for anime details
=======
>>>>>>> devSwiftUI

### (4/6/2023)
- Rework code from Python to Swift.
- This also means migrating from Django web framework to SwiftUI framework for iOS and MacOS.
    - If workable, try to use (SwiftWasm)[https://swiftwasm.org/] for the web aspect.
        - Will be able to leverage and improve on gained HTML and SASS experience from working on (personal website)[https://seikahirori.github.io/]

# First phase of project
- Learn how to parse and obtain values from user's MAL/Anilist/Kitsu.io list...
- As well as obtain certain values from the anime database JSON
    - Thanks to Minami Project for hosting and updating the anime database!
        - Link: https://github.com/manami-project/anime-offline-database/blob/master/anime-offline-database.json
- From the user's list, obtain a random anime title.
- Due to how anime title's ID (id primarily belongs to MAL) are stored on each of the sites...
    - If user primarily site is either Anilist or Kitsu.io:
        - Obtain value from "sources" in anime database for respective site.
- Return information to user to go and watch that anime from their backlog :3

# Future phases
I won't talk future plans about it publically as things are always bound to change. I am learning about so much of these cool tools, so it's constantly evolving. The next phase should be interesting though :3
