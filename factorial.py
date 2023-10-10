# PEP 8 recommends two blank lines before top-level function or class definitions.

def greet(name):
    # PEP 8 recommends using 4 spaces for indentation (no tabs).
    """This function greets the person passed in as a parameter."""
    
    # PEP 8 recommends using double quotes for docstrings.
    print(f"Hello, {name}!")

if __name__ == "__main__":
    # PEP 8 recommends using "if __name__ == "__main__":" to guard the execution of the script.
    name = input("Enter your name: ")
    greet(name)
