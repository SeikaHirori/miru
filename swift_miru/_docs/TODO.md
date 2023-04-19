#  TODO


## Views
- [ ] Random Anime Entry

- [ ] View information for each anime entry that contains:
    - Title
    - Season
    - Sources

- [x] Button "load local db"
    - See if we can have a "Task" and "async" functional for when loading Db locally
        - Reference how button "Download Db" works
            - Can't implement the web-style as it won't work.

    - CHECK COMMIT for implementation of Async/ Concurrency
        - Commit:
            -
        - Program no longer freezes when Button "load local db" is pressed!

## Logic
- [ ] Parse User's XML info from either MyAnimeList (MAL), Kitsu, or Anilist
- [ ] Grab MAL id from MAL so it can be used to link up to User's list
- [x] Download JSON from Manami's GitHub
- [ ] Add progress bar/circle for when:
    - [ ] Downloading JSON
    - [ ] Loading local JSON
    - [ ] Saving db to userdefault
- Learn and implement Core Data
