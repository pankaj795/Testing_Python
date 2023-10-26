# pylint: disable=invalid-name, missing-docstring, unused-argument


def w(b):  # Invalid function and argument name
    x = 50
    y = 3
    return x + y


# Missing docstring for function


class MyClass:
    def __init__(self):
        self.var = 1

    def my_method(self):  # Method with no docstring
        return self.var
