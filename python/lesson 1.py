print(3 + 5)
# + Addition
# - Subtraction
# * Multiplication
# / Division
# % Mod (the remainder after dividing)
# ** Exponentiation (note that ^ does not do this operation, as you might have seen in other languages)
# // Divides and rounds down to the nearest integer

# ex
# Write an expression that calculates the average of 23, 32 and 64.
# Place the expression in this print statement.
print((23 + 32 + 64)/3)

# Fill this in with an expression that calculates how many tiles are needed.
print(9*7 +5*7)

# Fill this in with an expression that calculates how many tiles will be left over.
print((17*6)-(9*7 + 5*7))

# quiz with variables

# The current volume of a water reservoir (in cubic metres)
reservoir_volume = 4.445e8
# The amount of rainfall from a storm (in cubic metres)
rainfall = 5e6

# decrease the rainfall variable by 10% to account for runoff
rainfall *= .9

# add the rainfall variable to the reservoir_volume variable
reservoir_volume += rainfall

# increase reservoir_volume by 5% to account for stormwater that flows
# into the reservoir in the days following the storm
reservoir_volume *= 1.05

# decrease reservoir_volume by 5% to account for evaporation
reservoir_volume *= .95

# subtract 2.5e5 cubic metres from reservoir_volume to account for water
# that's piped to arid regions.
reservoir_volume -= 2.5e5

# print the new value of the reservoir_volume variable
print(reservoir_volume)

# boolean - comparison operators
# < > <= >= == =!

# boolean - logican operators
# and = evaluates if all statements are true
# or = evaluates if at least one state is true
# not = not flips the bool value

sf_population, sf_area = 864816, 231.89
rio_population, rio_area = 6453682, 486.5

san_francisco_pop_density = sf_population/sf_area
rio_de_janeiro_pop_density = rio_population/rio_area

# Write code that prints True if San Francisco is denser than Rio, and False otherwise
print (san_francisco_pop_density > rio_de_janeiro_pop_density)

# strings, "" and '' both work except for some edge cases
# \ escape character
# you can use + and * to combine and repeat strings

# len, returns length of an object

# TODO: Fix this string!
ford_quote = "Whether you think you can, or you think you can't--you're right."

#########################

username = "Kinari"
timestamp = "04:50"
url = "http://petshop.com/pets/mammals/cats"

# TODO: print a log message using the variables above.
# The message should have the same format as this one:
# "Yogesh accessed the site http://petshop.com/pets/reptiles/pythons at 16:20."
print( username + " accessed the site " + url + " at " + timestamp + ".")

#########################

given_name = "William"
middle_names = "Bradley"
family_name = "Pitt"
full_name = given_name + " " + middle_names + " " + family_name
name_length = len(full_name)

# Now we check to make sure that the name fits within the driving license character limit
# Nothing you need to do here
driving_license_character_limit = 28
print(name_length <= driving_license_character_limit)

# type conversion
>>> print(type(4))
int
>>> print(type(3.7))
float
>>> print(type('this'))
str
>>> print(type(True))
bool

################################

weekly_sales = int(mon_sales) + int(tues_sales) + int(wed_sales) + int(thurs_sales) + int(fri_sales)
weekly_sales = str(weekly_sales)  #convert the type back!!
print("This week's total sales: " + weekly_sales)

# Methods, functions that belong to an object
# Methods have arguments that go in (), although the first argument is the object 

# format
print("Mohammed has {} balloons".format(27))
# Mohammed has 27 balloons
animal = "dog"
action = "bite"
print("Does your {} {}?".format(animal, action))
# Does your dog bite?
maria_string = "Maria loves {} and {}"
print(maria_string.format("math", "statistics"))
# Maria loves math and statistics

# Write two lines of code below, each assigning a value to a variable
dog = "Annie"
owner = "Taylor"
# Now write a print statement using .format() to print out a sentence and the 
#   values of both of the variables
print("{} is {}'s dog!".format(dog, owner))