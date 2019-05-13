try:
    x = int(input('Enter a number: '))
except:
    print('That\'s not a valid number!')

try:
    x = int(input('Enter a number: '))
except:
    print('That\'s not a valid number!')
finally:
    print('\nAttempted Input\n')

while True:
    try:
        x = int(input('Enter a number: '))
    except:
        print('That\'s not a valid number!')
    finally:
        print('\nAttempted Input\n')

try:
    x = int(input('Enter a number: '))
except ValueError:
    print('That\'s not a valid number!')

try:
    x = int(input('Enter a number: '))
except (ValueError, KeyboardInterrupt):
    print('That\'s not a valid number!')

try:
    x = int(input('Enter a number: '))
except ValueError:
    print('That\'s not a valid number!')
except KeyboardInterrupt:
    print('Alright I guess we are done here.')

#############################################

def party_planner(cookies, people):
    leftovers = None
    num_each = None
    # TODO: Add a try-except block here to
    #       make sure no ZeroDivisionError occurs.
    try:
        num_each = cookies // people
        leftovers = cookies % people
    except ZeroDivisionError:
        print("Oops, you entered 0 people will be attending.")
        print("Please enter a good number of people for a party.")
    return(num_each, leftovers)

# The main code block is below; do not edit this
lets_party = 'y'
while lets_party == 'y':

    cookies = int(input("How many cookies are you baking? "))
    people = int(input("How many people are attending? "))

    cookies_each, leftovers = party_planner(cookies, people)

    if cookies_each:  # if cookies_each is not None
        message = "\nLet's party! We'll have {} people attending, they'll each get to eat {} cookies, and we'll have {} left over."
        print(message.format(people, cookies_each, leftovers))

    lets_party = input("\nWould you like to party more? (y or n) ")

#############################################

# accessing error messages
try:
    x = 78/0
except ZeroDivisionError as e:
   print("ZeroDivisionError occurred: {}".format(e))

# ZeroDivisionError occurred: integer division or modulo by zero


# handle any error, but still read the error message
try:
    y = 'here is some neat code'
except Exception as e:
   # some code
   print("Exception occurred: {}".format(e))