#FUNDAMENTALS

#SquaringTheElementsOfAnArrayAndSummingThemUp
import math
def squareArr(arr):
    b = []
    for i in arr:
        b.append(math.pow(i,2))
    print(sum(b))
squareArr([1,2,4,6])

#SumOfNumbers

def get_sum(a,b):
    x = range(a,b+1)
    print(sum(x))
get_sum(-1,5)

#Function
def f(n):
    x = range(1,n+1)
    b = sum(x)
    print(b)
    pass
f(100)

#BinaryConversionGenerator

def binaryDigit(n):
    b = []
    while n // 2 >= 1:
        b.append(n % 2)
        n = n // 2
    if n // 2 < 1:
        b.append(1)
    str1 = "".join(str(e) for e in b)
    print(str1[::-1])
binaryDigit(2567982)

#SummationOfCubes
 #Finds how many cubes fit in a volume m while decreasing by an increment of one
# n^3 + n-1^3 + .....+1^3 = m(Append all values from 1 to n to count amount of cubes by increasing)

def remove_smallest(numbers):
    if len(numbers) == 0:
        print([])
    else:
        numbers.remove(min(numbers))
        print(numbers)
remove_smallest([29,56,82,14,198])


#JOININGLISTSOFNUMBERSTOFORMALARGERNUMBER

x = [1,2,2,3,3,4,4,5]
x = map(str, x)
print("".join(x))

#TitleCasingStrings

def title_case(title, minor_words):
    title = title.lower()
    if title != minor_words:
        print(title.title())
title_case('THE WIND IN THE WILLOWS', 'The In')

#NarcissisticNumbers
def NarcissisticValue(i):
    b = [int(d) for d in str(i)]
    c = []
    for a in b:
        c.append(a**len(b))
    if sum(c) == i:
        print("True")
    else:
        print("False")
NarcissisticValue(371)

#LuhnsAlgorithm

def divisors(integer):
    b = []
    i = 1
    while i < integer:
        if integer % i == 0 and i != 1 and integer != i and integer > 0:
            b.append(i)
        elif integer % i != 0 and i == integer:
        	print(str(integer) + " is prime.")
       	i += 1
    print(b)
