#EvenFibonacciNumbers
from sys import exit

def fib(n):
    if n < 2:
        return n
    return fib(n-2) + fib(n-1)

for i in range(1,5):
    print(fib(i))
    list = [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040,1346269,2178309,3524578]
b = [] #AllFibonacciNumbersLessThan4000000
for i in list:
    if i % 2 == 0:
        b.append(i)
c = sum(b)
print(c)


#PythagoreanTriple
for b in range(0,500):
	a=(1000*(b-500))/(b-1000)
	aa=(1000*(b-500))/(b-1000)
	if a==aa  :
		c=(a**2+b**2)**.5
		if a<b<c and a*b*c == int(a*b*c):
			print(a*b*c)

#


#PowerDigitSum
sum = 0
#Converts number to string
for n in str(2**1000):
	sum += int(n)
print sum

def enumerate(sequence, start=0):
    n = start
    for elem in sequence:
        yield n, elem
        n += 1
