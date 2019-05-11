# reading files
f = open('/my_path/my_file.txt', 'r')
# the r argument means read only, but it does not really need to be specified as it open is read only by default
file_data = f.read()
f.close()

print (file_data)

# opening a file in writing mode
f = open('my_path/my_file.txt', 'w')
f.write("Hello there!")
f.close()
# this will actually erase the contents of the file, if you want to add to a file use 'a' for append

# too many open files
files = []
for i in range(10000):
    files.append(open('some_file.txt', 'r'))
    print(i)

# with
# this is a special syntax that opens the file and performs actions and closes it automatically

with open('my_path/my_file.txt', 'r') as f:
    file_data = f.read()

print(file_data)

# you can pass the read method an integer and it will read up to that character, then leave the window there to resume later:
with open("camelot.txt") as song:
    print(song.read(2))
    print(song.read(8))
    print(song.read())
# output:
# We
# 're the 
# knights of the round table
# We dance whenever we're able

# readline will read one line of a file at a time instead of outputting a '\n'

f.readline()
# output: 'This is the first line of the file.\n'
f.readline()
# output: 'Second line of the file\n'
f.readline()
# output: ''

# read in the lines of a file and write them to a list
camelot_lines = []
with open("camelot.txt") as f:
    for line in f: # this allows you to loop through the lines in a file
        camelot_lines.append(line.strip()) # read lines, but strip the trailing whitespace

print(camelot_lines)
# output: ["We're the knights of the round table", "We dance whenever we're able"]