factorial(n);
def factorial(n):

    RES = 1

    for i in range(2, n+1):
        RES *= i
    return RES
 # Driver Code
NUM = 5
print("Factorial of", NUM, "is",
factorial(NUM))
