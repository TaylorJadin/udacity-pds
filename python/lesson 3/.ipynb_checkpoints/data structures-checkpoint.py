# list = data structure that is a mutable ordered sequences

list_of_random_things = [1, 3.4, 'a string', True]
list_of_random_things[0]
# output: 1

list_of_random_things[len(list_of_random_things) - 1]
# output: True

list_of_random_things[-1]
#output: True
list_of_random_things[-2]
# output: a string

# slicing = use indices to slice off parts of an object, like in a string or a list
months = ['Jaunary', 'February', 'March', 'April', 'May', 'June',
          'July', 'August', 'September', 'October', 'November', 'December']
q3 = months[6:9]
# grab index 6, 7, 8, but not 9
# lower bound inclusive, upper bound exclusive
print(q3)

# you can ommit the starting or ending index to go all the way to the begginning or end respectively

first_half = months[:6]
second_half = months[6:]
print(first_half)
print(second_half)

# 'in' or 'not in'

'this' in 'this is a string'
# output: True
'in' in 'this is a string'
# output: True
'isa' in 'this is a string'
# output: False
5 not in [1, 2, 3, 4, 6]
# output: True
5 in [1, 2, 3, 4, 6]
# output: False

VINIX = ['C', 'MA', 'BA', 'PG', 'CSCO', 'VZ', 'PFE', 'HD', 'INTC', 'T', 'V', 'UNH', 'WFC',
         'CVX', 'BAC', 'JNJ', 'GOOGL', 'GOOG', 'BRK.B', 'XOM', 'JPM', 'FB', 'AMZN', 'MSFT', 'AAPL']
'GE' in VINIX
# output: False

'GOOGL' in VINIX
# output: True

# mutability = whether or not we can change an object once it has been created
# mutable = changeable, immutable = unchangeable

# strings are immutable:
greeting = "Hello there"
# this won't work:
# greeting[0] = 'M'

# orer is whether the position of an element in an object can be used to access the element
# both strings and lists are ordered

########################################################
month = 8
days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# use list indexing to determine the number of days in month
num_days = days_in_month[month - 1]

print(num_days)
########################################################
eclipse_dates = ['June 21, 2001', 'December 4, 2002', 'November 23, 2003',
                 'March 29, 2006', 'August 1, 2008', 'July 22, 2009',
                 'July 11, 2010', 'November 13, 2012', 'March 20, 2015',
                 'March 9, 2016']


# TODO: Modify this line so it prints the last three elements of the list
print(eclipse_dates[-3:])
########################################################
sentence1 = "I wish to register a complaint."
sentence2 = ["I", "wish", "to", "register", "a", "complaint", "."]
sentence2[0:2] = ["We", "want"]
print(sentence2)
# output: ['We', 'want', 'to', 'register', 'a', 'complaint', '.']
########################################################


# because strings are immutable this happens:
name = 'Jim'
student = name
name = 'Tim'  # overwrite name
print(name)
# output: Tim
print(student)
# output: Jim

# but because lists are mutable:
scores = ["B", "C", "A", "D", "B", "A"]
grades = scores
print("scores: " + str(scores))
# output: scores: ['B', 'C', 'A', 'D', 'B', 'A']
print("grades: " + str(grades))
# output: scores: ['B', 'C', 'A', 'D', 'B', 'A']
scores[3] = "B"
print("scores: " + str(scores))
# output: scores: ['B', 'C', 'A', 'B', 'B', 'A']
print("grades: " + str(grades))
# output: scores: ['B', 'C', 'A', 'B', 'B', 'A']

# useful functions for lists:
# len() returns how many elements are in a list.
# max() returns the greatest element of the list. How the greatest element is determined depends on what type objects are in the list. The maximum element in a list of numbers is the largest number. The maximum elements in a list of strings is element that would occur last if the list were sorted alphabetically. This works because the the max function is defined in terms of the greater than comparison operator. The max function is undefined for lists that contain elements from different, incomparable types.
# min() returns the smallest element in a list. min is the opposite of max, which returns the largest element in a list.
# sorted() returns a copy of a list in order from smallest to largest, leaving the list unchanged.

# join, takes a list of strings as an arg and returns one string with the elements joined by a separator string
new_str = "\n".join(["fore", "aft", "starboard", "port"])
print(new_str)
# output: fore
# output: aft
# output: starboard
# output: port

name = "-".join(["García", "O'Kelly"])
print(name)
# output: Garcia-O'Kelly

# append, adds an element to the end of a list
letters = ['a', 'b', 'c', 'd']
letters.append('z')
print(letters)
# output: ['a', 'b', 'c', 'd', 'z']

#############################################
a = [1, 5, 8]
b = [2, 6, 9, 10]
c = [100, 200]

print(max([len(a), len(b), len(c)]))
print(min([len(a), len(b), len(c)]))
# output: 4,1
#############################################
names = ["Carol", "Albert", "Ben", "Donna"]
print(" & ".join(sorted(names)))
# output: Albert & Ben & Carol & Donna
#############################################
names = ["Carol", "Albert", "Ben", "Donna"]
names.append("Eugenia")
print(sorted(names))
# output: ['Albert', 'Ben', 'Carol', 'Donna', 'Eugenia']
#############################################

# tuples: data type for immutable ordered sequences of elements, often used to store related pieces of information that will almost always be used together
# ex: latitude and longitutde

location = (13.4125, 103.866667)
print("Latitude:", location[0])
print("Longitude:", location[1])

# tuples can also assign multiple variables in a compact way
# () optional with tuples
# tuple unpacking =  variables can be assigned from the content of a tuple
dimensions = 52, 40, 100
length, width, height = dimensions
print("The dimensions are {} x {} x {}".format(length, width, height))
# OR, if we don't need dimensions directly:
length, width, height = 52, 40, 100
print("The dimensions are {} x {} x {}".format(length, width, height))

# set, data type for mutable unordered collections of unique elements
# one use is to quickly remove duplicates from a list
# not sortable
numbers = [1, 2, 6, 3, 1, 1, 6]
unique_nums = set(numbers)
print(unique_nums)
# output: {1, 2, 3, 6}
# sets do support in just like lists
# you can use the add method and pop method to add and remove elements, like with lists
# with pop, a random elements is removed because sets are unordered, so there is no last element
fruit = {"apple", "banana", "orange", "grapefruit"}  # define a set
print("watermelon" in fruit)  # check for element
fruit.add("watermelon")  # add an element
print(fruit)
print(fruit.pop())  # remove a random element
print(fruit)

# dictionaries, data type for mutable objects that store mappings of unique keys to values, it is technically unordered
# stores pairs, keys and values
# dictionary keys need to be immutable
elements = {"hydrogen": 1, "helium": 2, "carbon": 6}
print(elements["helium"])  # print the value mapped to "helium"
# insert "lithium" with a value of 3 into the dictionary
elements["lithium"] = 3
print("carbon" in elements)
# output: True
# get looks up values in a dictionary, but returns None if the key isn't found instead of an errorƒ
print(elements.get("dilithium"))
# output: None
# you can set a default value when a key is not found
elements.get('kryptonite', 'There\'s no such element!')
# output: "There's no such element!"
#############################################
population = {"Shanghai": 17.8, "Istanbul": 13.3,
              "Karachi": 13.0, "Mumbai": 12.5}
#############################################

# identity operators are is or is not
# see the difference between equality and identity operators:

a = [1, 2, 3]
b = a
c = [1, 2, 3]
print(a == b)
# output: True
print(a is b)
# output: True
print(a == c)
# output: True
print(a is c)
# output: False
#############################################
animals = {'dogs': [20, 10, 15, 8, 32, 15], 'cats': [
    3, 4, 2, 8, 2, 4], 'rabbits': [2, 3, 3], 'fish': [0.3, 0.5, 0.8, 0.3, 1]}
#############################################

# compound data structures, dictionaries in dictionaries!

elements = {"hydrogen": {"number": 1,
                         "weight": 1.00794,
                         "symbol": "H"},
              "helium": {"number": 2,
                         "weight": 4.002602,
                         "symbol": "He"}}
helium = elements["helium"]  # get the helium dictionary
hydrogen_weight = elements["hydrogen"]["weight"]  # get hydrogen's weight
# you can of course add new keys to the dictionary:
oxygen = {"number":8,"weight":15.999,"symbol":"O"}  # create a new oxygen dictionary 
elements["oxygen"] = oxygen  # assign 'oxygen' as a key to the elements dictionary
print('elements = ', elements)
# output: elements =  {"hydrogen": {"number": 1,
            #               "weight": 1.00794,
            #               "symbol": 'H'},
            #    "helium": {"number": 2,
            #               "weight": 4.002602,
            #               "symbol": "He"}, 
            #    "oxygen": {"number": 8, 
            #               "weight": 15.999, 
            #               "symbol": "O"}}

#############################################
elements = {'hydrogen': {'number': 1, 'weight': 1.00794, 'symbol': 'H'},
            'helium': {'number': 2, 'weight': 4.002602, 'symbol': 'He'}}

# todo: Add an 'is_noble_gas' entry to the hydrogen and helium dictionaries
# hint: helium is a noble gas, hydrogen isn't

elements['hydrogen']['is_noble_gas'] = False
elements['helium']['is_noble_gas'] = True
#############################################
verse = "if you can keep your head when all about you are losing theirs and blaming it on you   if you can trust yourself when all men doubt you     but make allowance for their doubting too   if you can wait and not be tired by waiting      or being lied about  don’t deal in lies   or being hated  don’t give way to hating      and yet don’t look too good  nor talk too wise"
print(verse, "\n")

# split verse into list of words
verse_list = verse.split()
print(verse_list, '\n')

# convert list to set to get unique words
verse_set = set(verse_list)
print(verse_set, '\n')

# print the number of unique words
num_unique = len(verse_set)
print(num_unique)
#############################################
verse_dict =  {'if': 3, 'you': 6, 'can': 3, 'keep': 1, 'your': 1, 'head': 1, 'when': 2, 'all': 2, 'about': 2, 'are': 1, 'losing': 1, 'theirs': 1, 'and': 3, 'blaming': 1, 'it': 1, 'on': 1, 'trust': 1, 'yourself': 1, 'men': 1, 'doubt': 1, 'but': 1, 'make': 1, 'allowance': 1, 'for': 1, 'their': 1, 'doubting': 1, 'too': 3, 'wait': 1, 'not': 1, 'be': 1, 'tired': 1, 'by': 1, 'waiting': 1, 'or': 2, 'being': 2, 'lied': 1, 'don\'t': 3, 'deal': 1, 'in': 1, 'lies': 1, 'hated': 1, 'give': 1, 'way': 1, 'to': 1, 'hating': 1, 'yet': 1, 'look': 1, 'good': 1, 'nor': 1, 'talk': 1, 'wise': 1}
print(verse_dict, '\n')

# find number of unique keys in the dictionary
num_keys = len(verse_dict)
print(num_keys)

# find whether 'breathe' is a key in the dictionary
contains_breathe = "breathe" in verse_dict
print(contains_breathe)

# create and sort a list of the dictionary's keys
sorted_keys = sorted(verse_dict.keys())

# get the first element in the sorted list of keys
print(sorted_keys[0])

# find the element with the highest value in the list of keys
print(sorted_keys[-1]) 
#############################################