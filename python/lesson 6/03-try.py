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