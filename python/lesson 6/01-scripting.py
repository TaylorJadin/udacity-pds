how_many_snakes = 1
snake_string = """
Welcome to Python3!

             ____
            / . .\\
            \  ---<
             \  /
   __________/ /
-=:___________/

<3, Juno
"""


print(snake_string * how_many_snakes)

# scripting with raw input
name = input("Enter your name: ")
print("Hello there, {}!".format(name.title()))

# wrapping with int
num = int(input("Enter an integer"))
print("hello" * num)

# wrap with float to catch non integers
num = float(input("Enter an number"))
print("hello" * num)

# or wrap with both to catch a non integer and convert back to int
num = int(float(input("Enter an number")))
print("hello" * num)

# allow users to input a python expression with eval
result = eval(input("Enter an expression: "))
print(result)