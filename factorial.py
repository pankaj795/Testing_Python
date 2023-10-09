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

def subtract_numbers(a, b):
    """
    Subtract two numbers and return the result.

    Args:
        a (int): The first number.
        b (int): The second number.

    Returns:
        int: The result of subtracting b from a.

    Example:
        >>> subtract_numbers(5, 2)
        3
    """
    return a - b

# Test the functions
if __name__ == "__main__":
    result1 = add_numbers(2, 3)
    print(f"Result of adding: {result1}")

    result2 = subtract_numbers(5, 2)
    print(f"Result of subtracting: {result2}")
