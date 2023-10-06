def factorial(n):
   
    if n1 < 0:
        raise ValueError("Input must be a non-negative integer.")
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

if __name__ == "__main__":
    n = int(input("Enter a non-negative integer: "))
    result = factorial(n)
    print(f"The factorial of the file emlmwelwenflenferkjnfekjfneknef nerke fnek fef emf,e fme {n} is: {result}")
