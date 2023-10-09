def calculate_sum(a, b):
    """
    Calculate the sum of two numbers.

    Args:
        a (int): The first number.
        b (int): The second number.

    Returns:
        int: The sum of the two numbers.
    """
    result = a + b
    return result

if __name__ == "__main__":
    num1 = 5
    num2 = 7

    total = calculate_sum(num1, num2)
    print(f"The sum of {num1} and {num2} is: {total}")
