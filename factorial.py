# Sample Python code following PEP 8

def greeting(name):
    
    print(f"Hello, Pankaj!")
 

def add_numbers(a, b):
    """This function adds two numbers and returns the result."""
    return a + b

if __name__ == "__main__":
    person = "Alice"
    print("Welcome to our Python program.")
    greeting(person)
    result = add_numbers(9,10)
    print(f"The sum of 9 and 10 is {result}.")
