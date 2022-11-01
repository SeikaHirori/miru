from re import L
from src.search_algo import Search_algo

def test_binary_search_recursion():
    list_values:list[str] = [
    "Adam", 
    "beef", 
    "colobunga", 
    "dude", 
    "eric", 
    "frieza",
    "goku drip",
    ]

    s:Search_algo = Search_algo()
    target_string:str = list_values[4]
    start:int = 0
    end:int = len(list_values) - 1
    result:int = s.binary_search_recursion(list_values, target_string)

    assert result == 'eric'

def test_binary_search_looping():
    list_values:list[str] = [
    "Adam", 
    "beef", 
    "colobunga", 
    "dude", 
    "eric", 
    "frieza",
    "goku drip",
    ]

    s:Search_algo = Search_algo()
    target_string:str = list_values[4]
    result:int = s.binary_search_looping(list_values, target_string)

    assert result == 4

def test_sequential_search_front_and_end():
    list_values:list[str] = [
    "Adam", 
    "beef", 
    "colobunga", 
    "dude", 
    "eric", 
    "frieza",
    "goku drip",
    ] # Odd amount of elements
    s:Search_algo = Search_algo()
    target_string:str = "eric"
    result:int = s.sequential_search_front_and_end(list_values, target_string)
    assert result == 4


    list_values:list[str] = [
    "Adam", 
    "beef", 
    "colobunga", 
    "dude", 
    "eric", 
    "frieza",
    "goku drip",
    "mario"
    ] # Even amount of elements
    result:int = s.sequential_search_front_and_end(list_values, target_string)
    assert result == 4

    list_values:list[str] = [
    "Adam", 
    "beef", 
    "colobunga", 
    "dude", 
    "frieza",
    "goku drip",
    ]
    target_string:str = "eric"
    result:int = s.sequential_search_front_and_end(list_values, target_string)

    assert result == -1