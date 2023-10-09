def sum_of_three_numbers(a, b, c,d):
    """
    Calculate the sum of three numbers

    Args:
        a (int): The first number.
        b (int): The second number.
        c (int): The third number.
        d (int): The fourth number.

    Returns:
        int: The sum of the three numbers.
    """
    return a + b + c +d

if __name__ == "__main__":
    num1 = int(input("Enter the first number: "))
    num2 = int(input("Enter the second number: "))
    num3 = int(input("Enter the third number: "))
    num4 = int(input("Enter the fourth number: "))

    result = sum_of_three_numbers(num1, num2, num3,num4)

    print(f"The sum of {num1}, {num2}, {num3} and {num4} is: {result}")
