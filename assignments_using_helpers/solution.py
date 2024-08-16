a, b = list(map(int,input("Enter your input: ").split(" ")))

# all the contents will be extracted in the base dir
c = int(open("constant","r").read())

print("The sum of the two numbers is:", a + b + c)