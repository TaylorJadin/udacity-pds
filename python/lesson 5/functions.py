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
# a global variable can not be modified inside a function unless it is passed as an argument:
egg_count = 0
def buy_eggs():
    egg_count += 12 # purchase a dozen eggs
buy_eggs()

# a better thing to do is this:
egg_count = 0
def buy_eggs2(count):
    return count + 12  # purchase a dozen eggs
egg_count = buy_eggs2(egg_count)
