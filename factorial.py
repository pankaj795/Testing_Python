def factorial(p):
   
    if n1 < 0:
        raise ValueError("Input must be a non-negative integer.")
    if p == 0:
        return 1
    else:
        return p * factorial(n - 1)

if __name__ == "__main__":
    p = int(input("Enter a non-negative integer: "))
    result = factorial(p)
    print(f"The factorial of the file emlmwelwenflenferkjnfekjfneknef nerke fnek fef emf,e fme {p} is: {result}")
