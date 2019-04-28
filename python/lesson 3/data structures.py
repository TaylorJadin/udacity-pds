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

