#LongestCollatz
c = []
def Collatz(a):
    b = []
    while a != 1:
        if a % 2 == 0:
            b.append(a // 2)
            a = a // 2
        elif a % 2 != 0:
            b.append(3*a + 1)
            a = 3*a+1
    else:
        c.append(len(b))
a = 1
while a < 100000:
    Collatz(a)
    a += 1
else:
    max_value = max(c)
    max_index = c.index(max_value)
    print(max_index + 1) #Each initial value corresponds with the index plus one

#SelfExponentiation
n = 11
b = []
while n < 1000:
    b.append(n**n)
    n += 1
else:
    print(sum(b) + 10405071317)

#GoldbachsOtherConjecture

""" In order to solve this problem, implement the Sieve of Eratosthenes to go up from 1 to n(n being the actual value
being evaluated) and then state that if n(the value being found) - 2*y^2 = a prime, namely a prime generated between 1 and n,
then it fits. Continue looping until a contradiction comes. Also, the range for y's generation is from 1 to (sqrt(n/2) + 1) and odd
n is created by modular arithmetic."""

#DoubleBasePalindromes

def binaryDigit(n):
    b = []
    b.append(n)
    while n // 2 >= 1:
        b.append(n % 2)
        n = n // 2
    if n // 2 < 1:
        b.append(1)
    str1 = "".join(str(e) for e in b)
    print(str1[::-1])
binaryDigit(1296235)

#RobotSimulator
