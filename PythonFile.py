#SolutionForProjectEuler(PalindromicProblem)
def IsPalindrome(n):
	myStr = str(n)
	if myStr == myStr[::-1]:
		return 1
	else:
		return 0
import time

tStart = time.time()
Result = 0
for i in range(100,1000):
    for j in range(100,1000):
	if IsPalindrome(i*j) == 1 and (i*j) > Result:
	    Result = (i*j)
print "Winner = " + str(Result)
print "run time = " + str((time.time() - tStart))

#AmicableNumbers(WorkInProgress)

#Gigasecond
x = 0
x += 10**9/60/60/24/365
print("A gigasecond is exactly " + str(x) + " years.")

#SieveOfEratosthenes

''' In order to do this program, create a list called MultipleList and
make it so that all the numbers that have been evaluated are in said list
besides the starting number and create another list called primeList which
will contain all starting numbers(I.e. 2, 3,) and then numbers that have no
multiples within the list, which are primes. This is the conceptual solution
for the Sieve of Eratosthenes by computer programming.
'''

#SieveOfEratosthenes
def primes_sieve(limit):
    limitn = limit+1
    primes = range(2, limitn)

    for i in primes:
        factors = range(i, limitn,i )
        for f in factors[1:]:
            if f in primes:
                primes.remove(f)
    return primes

print primes_sieve(2000)

#SumOfMultiples

x =input()
a = range(2,x)

b = []
for i in a:
	if i % 3 == 0 or i % 5 == 0:
		b.append(i)

c = sum(b)
print(c)

#LeapYearProgram

x = input()

if x % 4 == 0 and x % 100 != 0:
	print(str(x) + " is a leap year.")
elif x % 100 == 0:
	print(str(x) + " is not a leap year.")
elif x % 100 == 0 and x % 400 == 0:
	print(str(x) + " is a leap year.")
else:
	print(str(x) + " is not a leap year.")

#AverageAndComparison
def better_than_average(class_points, your_points):
	if sum(class_points)/len(class_points) > your_points:
		print("False, your score is below the average.")
	elif sum(class_points)/len(class_points) <= your_points:
		print("True, your score is above or equal to the average.")
	return 0

better_than_average([1,2,3], 7)

#DescendingOrder(DoLaterForCodeWars)

#MultiplesOf3And5

def solution(number):
    c = []
    i = 1
    while i < number:
        if i % 3 == 0 or i % 5 == 0:
            c.append(i)
        elif i % 3 == 0 and i % 5 == 0:
            c.append(i)
        i += 1
    b = sum(c)
    print(b)
solution(234)
