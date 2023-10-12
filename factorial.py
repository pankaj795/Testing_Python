def calculate_sum(n):
   
    if n < 1:
        return 0

    total_sum1 = 0
    for i in range(1, n + 1):
        total_sum1 += i

    return total_sum1

if __name__ == "__main__":
    n = int(input("Enter the positive number u  want to enter vhvyvygvygvyvy: "))
    result = calculate_sum(n)
    print(f"The sum of numbers from 1 to {n} is: {result}")

