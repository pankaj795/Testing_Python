def calculate_sum(n):
    """
    Calculate the sum of numbers from 1 to n.
    
    :param n: The upper limit of the sum.
    :type n: int
    :return: The sum of numbers from 1 to n.
    :rtype: int
    """
    if n < 1:
        return 0

    total_sum1 = 0
    for i in range(1, n + 1):
        total_sum1 += i

    return total_sum1

if __name__ == "__main__":
    n = int(input("Enter a positive integer: "))
    result = calculate_sum(n)
    print(f"The sum of numbers from 1 to {n} is: {result}")
