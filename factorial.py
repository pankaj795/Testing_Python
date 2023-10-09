# PEP 8 compliant Python code example

def calculate_sum(a, b):
    """
    Calculate the sum of two numbers.

    Args:
        a (int): The first number.
        b (int): The second number.

    Returns:
        int: The sum of the two input numbers.
    """
    result = a + b
    return result

if __name__ == "__main__":
    num1 = 10
    num2 = 20
    total = calculate_sum(num1, num2)
    print(f"The sum of {num1} and {num2} is {total}")
