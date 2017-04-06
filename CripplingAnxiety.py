import random
random = random.randint(1,6)
print("Choose a number from one to six.")
guess = int(input())


while guess > random or guess < random:
    print("Sorry, that is wrong.")
    print("Choose a number from one to six.")
    guess = input()
while guess == random:
    print("Congratulations, your guess was correct.")
    break


b = []
a = [1,1,1]
b.extend(a)
print(b)
