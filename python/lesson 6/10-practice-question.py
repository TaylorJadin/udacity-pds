# Create a function that opens the flowers.txt, reads every line in it, and saves it as a dictionary. The main (separate) function should take user input (user's first name and last name) and parse the user input to identify the first letter of the first name. It should then use it to print the flower name with the same first letter (from dictionary created in the first function).

# output: >>> Enter your First [space] Last name only: Bill Newman
# output: >>> Unique flower name with the first letter: Bellflower

def readFlowers(filename):
    flowersDict = {}
    with open(filename) as f:
        for line in f:
            letter = line.split(':')[0].strip()
            flower = line.split(':')[1].strip().title()
            flowersDict[letter] = flower  
    return flowersDict

def main():
    flowers = readFlowers('10-flowers.txt')
    name = input("Enter your first and last name: ").title().strip()
    firstLetter = name[0].title()
    print(flowers.get(firstLetter))

main()


# print the desired output