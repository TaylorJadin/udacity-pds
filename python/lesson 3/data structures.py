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

# mutability = whether or not we can change an object once it has been created
# mutable = changeable, immutable = unchangeable

# strings are immutable:
greeting = "Hello there"
# this won't work:
# greeting[0] = 'M'

# orer is whether the position of an element in an object can be used to access the element
# both strings and lists are ordered

