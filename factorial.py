def factorial(n):
    """
    Calculate the factorial of a non-negative integer.

    Args:
        n (int): The non-negative integer for which to calculate the factorial.

    Returns:
        int: The factorial of the input integer.

    Raises:
        ValueError: If the input is a negative integer.
    """
    if n < 0:
        raise ValueError("Input must be a non-negative integer.")
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

if __name__ == "__main__":
    n = int(input("Enter a non-negative integer: "))
    result = factorial(n)
    print(f"The factorial of {n} is: {result}")
