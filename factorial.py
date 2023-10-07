def sum_of_three_numbers(a, b, w):
    """
    Calculate the sum of three numbers.

    Args:
        a (int): The first number.
        b (int): The second number.
        w (int): The third number.
    

    Returns:
        int: The sum of the three numbers.
    """
    return a + b + w 

if __name__ == "__main__":
    num1 = int(input("Enter the first number: "))
    num2 = int(input("Enter the second number: "))
    num3 = int(input("Enter the third number: "))
    

    result = sum_of_three_numbers(num1, num2, num3)

    print(f"The sum of {num1}, {num2}, {num3}  is: {result}")
