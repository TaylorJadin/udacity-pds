# defining functions

def cylinder_volume(height, radius):
    pi = 3.14159
    return height * pi * radius ** 2

# call the function
cylinder_volume(10, 3)

# default arguments
def cylinder_volume2(height, radius=5):
    pi = 3.14159
    return height * pi * radius ** 2

cylinder_volume2(10) # will be the same as
cylinder_volume2(10, 5) 

cylinder_volume2(10, 7) # override default argument

cylinder_volume2(10, 7) # pass in arguments by position
cylinder_volume2(height=10, radius=7) # pass in arguments by name

#############################################
# write your function here
def population_density(population, land_area):
    return population / land_area

# test cases for your function
test1 = population_density(10, 1)
expected_result1 = 10
print("expected result: {}, actual result: {}".format(expected_result1, test1))

test2 = population_density(864816, 121.4)
expected_result2 = 7123.6902801
print("expected result: {}, actual result: {}".format(expected_result2, test2))
#############################################
def readable_timedelta(days):
    weeks = days // 7
    remainder = days % 7
    return "{} weeks(s) and {} day(s).".format(weeks, remainder)

print(readable_timedelta(10))
#############################################

# if a variable is created inside a function, its only accessible inside that function
# if a variable is created outside a function it has a global scope
# a global variable can not be modified inside a function unless it is passed as an argument
# instead, modify the variable outside the function
egg_count = 0
def buy_eggs2(count):
    return count + 12  # purchase a dozen eggs
egg_count = buy_eggs2(egg_count)

# docstrings
def population_density2(population, land_area):
    """Calculate the population density of an area. """
    return population / land_area

def population_density3(population, land_area):
    """Calculate the population density of an area.

    INPUT:
    population: int. The population of that area
    land_area: int or float. This function is unit-agnostic, if you pass in values in terms
    of square km or square miles the function will return a density in those units.

    OUTPUT: 
    population_density: population / land_area. The population density of a particular area.
    """
    return population / land_area
#############################################
# mine
def readable_timedelta2(days):
    """
    Calculate the how many weeks and days a number of days is equal to

    Args:
        days: number of days
    Returns:
        Returns week(s) and day(s) as a string in this format:
        "1 week(s) and 4 day(s)"
    """

    weeks = days // 7
    remainder = days % 7
    return "{} week(s) and {} day(s)".format(weeks, remainder)

# some examples
def readable_timedelta3(days):
    """Return a string of the number of weeks and days included in days."""
    weeks = days // 7
    remainder = days % 7
    return "{} week(s) and {} day(s)".format(weeks, remainder)

def readable_timedelta4(days):
    """Return a string of the number of weeks and days included in days.

    Args:
        days (int): number of days to convert
    """
    weeks = days // 7
    remainder = days % 7
    return "{} week(s) and {} day(s)".format(weeks, remainder)

def readable_timedelta5(days):
    """
    Return a string of the number of weeks and days included in days.

    Parameters:
    days -- number of days to convert (int)

    Returns:
    string of the number of weeks and days included in days
    """
    weeks = days // 7
    remainder = days % 7
    return "{} week(s) and {} day(s)".format(weeks, remainder)
#############################################

# lambda expressions, functions that don't have a name

# this:
def multiply(x, y):
    return x * y
# becomes this:
multiply2 = lambda x, y: x * y
# call it!
multiply2(4, 7)

#############################################
numbers = [
              [34, 63, 88, 71, 29],
              [90, 78, 51, 27, 45],
              [63, 37, 85, 46, 22],
              [51, 22, 34, 11, 18]
           ]

averages = list(map(
    lambda num_list: sum(num_list) / len(num_list),
    numbers
    ))

print(averages)
#############################################
cities = ["New York City", "Los Angeles", "Chicago", "Mountain View", "Denver", "Boston"]

short_cities = list(filter(
    lambda name: len(name) < 10,
    cities
    ))
print(short_cities)
