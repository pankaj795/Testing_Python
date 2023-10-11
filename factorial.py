# Sample Python code following PEP 8

def greeting(name):
    """This function prints a greeting message."""
    print(f"Hello, {name}!")

def add_numbers(a, b):
    """This function adds two numbers and returns the result."""
    return a + b

if __name__ == "__main__":
    person = "Pankaj"
    print("Welcome to our Python program.")
    greeting(person)
    result = add_numbers(5, 7)
    print(f"The sum of 5 and 7 is {result}.")
