# This is a simple Python program that follows PEP 8 guidelines for testing.

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

# Test the function

    result2 = addition_numbers(10, 2)
    print(f"Result of subtracting: {result2}")
