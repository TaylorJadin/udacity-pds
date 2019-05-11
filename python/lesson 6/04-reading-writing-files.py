# reading files
f = open('/my_path/my_file.txt', 'r')
# the r argument means read only, but it does not really need to be specified as it open is read only by default
file_data = f.read()
f.close()

print (file_data)

# opening a file in writing mode
f = open('some_file.txt', 'w')
# this will actually erase the contents of the file, if you want to add to a file use 'a' for append

