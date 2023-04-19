# Objectives

## Primary
- Rework previous iteration; reworking project by moving from Python and Django to Swift and SwiftUI
- Parse XML file from User's list from MAL, Anilist, and Kitsu.io

## Secondary
- Allow user to import and export their list
    - List should be in XML, and need to see if it would be compatible if uploaded to MAL, Anilist, and Kitsu
    - User should be allowed to upload their list either:
        - Locally from iOS/ MacOS
            - iOS aspect needs to be more researched
        - OR linked through the websites
            - There might be APIs from the sites to potentially sync up their list?
                - This might cause data conflicts
                    - EX: One entry might have different values on MAL vs this app
                        - i.e. different episode count
                - From examination of XML files from MAL, Anilist, and Kitsu.io: 
                    - There is not a data value for "last updated by user" 
- Implement MacOS app
- Add functional tests to SwiftUI
- Filter search by:
    - Genre
    - Release season
- Stylize UI

## Bonus
- Utilize [SwiftWasm](https://swiftwasm.org/) for Web app
    - Framework options:
        - [Tokamak](https://github.com/TokamakUI/Tokamak)