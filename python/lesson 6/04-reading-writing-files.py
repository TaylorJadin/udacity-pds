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