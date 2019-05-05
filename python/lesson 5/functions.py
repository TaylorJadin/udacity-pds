# defining functions

def cylinder_volume(height, radius):
    pi = 3.14159
    return height * pi * radius ** 2

# call the function
cylinder_volume(10, 3)

# default arguments
def cylinder_volume(height, radius=5):
    pi = 3.14159
    return height * pi * radius ** 2

cylinder_volume(10) # will be the same as
cylinder_volume(10, 5) 

cylinder_volume(10, 7) # override default argument

cylinder_volume(10, 7) # pass in arguments by position
cylinder_volume(height=10, radius=7) # pass in arguments by name

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