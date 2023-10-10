# This is a simple Python program that follows PEP 8 guidelines for testing.

def add_numbers(a, b):
    """
    Add two numbers and return the result.

    Args:
        a (int): The first number.
        b (int): The second number.

    Returns:
        int: The sum of the two numbers.

    Example:
        >>> add_numbers(2, 3)
        5
    """
    return a + b

def addition_numbers(a, b):
    """
    addition two numbers and return the result.

    Args:
        a (int): The first number.
        b (int): The second number.

    Returns:
        int: The result of subtracting b from a.

    Example:
        >>> addition_numbers(5, 2)
        3
    """
    return a - b

# Test the functions
if __name__ == "__main__":
    result1 = add_numbers(2, 7)
    print(f"Result of adding: {result1}")

    result2 = addition_numbers(10, 2)
    print(f"Result of subtracting: {result2}")
