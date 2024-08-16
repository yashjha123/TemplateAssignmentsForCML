import sys


a,b = sys.argv[1], sys.argv[2]

a_int = int(open(a, "r").read())
b_int = int(open(b, "r").read())

print("The sum of the two numbers is:", a_int + b_int)