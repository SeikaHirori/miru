from enum import auto
import pytest
from src.parse_info import download_anime_database_json

from pytest_socket import socket_disabled

manami_project_json_license_name:str = "GNU Affero General Public License v3.0"
manami_project_json_license_url:str = "https://github.com/manami-project/anime-offline-database/blob/master/LICENSE"
manami_project_json_repository:str = "https://github.com/manami-project/anime-offline-database"

name_minified_anime_database:str = "anime-offline-database-minified.json"
name_regular_anime_database:str = "anime-offline-database.json"

def fail_intentionally_sadge():
    assert None == "failed intentionally"


class Tests_UNITS_download_anime_database_json:

    def check_file_existence_local_json(self, ): # Have this run when Json is downloaded instead.
        download_p_a_db:download_anime_database_json = download_anime_database_json()
        
        assert download_p_a_db.existence_json == False, f"Should report false when first launch."

        download_p_a_db.verify_existence_local_json()
        assert download_p_a_db.existence_json == True, f"Method runs and checks that the json exists locally."
        assert './database_project_manami/' or '/database_project_manami/' in download_p_a_db.pathway_json  
        assert name_minified_anime_database or name_regular_anime_database in download_p_a_db.pathway_json


        # assert 'was found. This will be used :3' in output_message

    def test_check_internet_connection(self):
        download_p_a_db:download_anime_database_json = download_anime_database_json()

        current_connection:str = download_p_a_db.status_connection_online
        assert current_connection == "offline",f"Connection should default to offline. Instead, it is currently '{current_connection}'."

        download_p_a_db.check_internet_connection()
        current_connection:str = download_p_a_db.status_connection_online
        assert current_connection == "online", f"Connection should be online. Instead, it is currently '{current_connection}'."

    def test_download_json_sucess(self):
        download_p_a_db:download_anime_database_json = download_anime_database_json()
        output_json:dict = download_p_a_db.download_json()

        # assert "Sucessfully downloaded one of the databases!" and "was downloaded" in output_message
        # assert name_regular_anime_database or name_minified_anime_database in output_message

        assert output_json['license']['name'] == manami_project_json_license_name
        assert output_json['license']['url'] == manami_project_json_license_url
        assert output_json['repository'] == manami_project_json_repository

        self.check_file_existence_local_json()
        
    # def test_download_json_failed(self): #force offline mode so no network connection is made # Don't think this test is needed. Can't force to not connect offline.
        
    #     download_p_a_db:download_anime_database_json = download_anime_database_json()
    #     output_response = download_p_a_db.download_json(True)
        
    #     # assert output_message == "Failed to either Json options for anime offline databases :'["
    #     assert output_response == None

    def test_verify_correct_repo_local_file_exists(self):
        download_p_a_db:download_anime_database_json = download_anime_database_json()

        assert download_p_a_db.correct_repo == False,'Upon start up, it should be immediately False'

        download_p_a_db.verify_correct_repo_of_json()
        assert download_p_a_db.correct_repo == True, 'After checking, the file should exist.'
