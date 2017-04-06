list = range(1,101)

a = []
b = []

for i in list:
    a.append(i*i)
c = sum(a)
print(c)

e = sum(list)
print(e*e)
print(e*e - c)

#FactorialDigitSum
n = 100
def fact(n):
    if n < 2:
        return n
    return n * fact(n-1)

sum = 0
for n in str(fact(n)):
	sum += int(n)
print sum
#PalindromicProducts
x = 289982

i = 1
b = []
while i < 289982:
    if x % i == 0:
        b.append(i)
i += 1

print(b)
