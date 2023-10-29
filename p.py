# pylint: disable=invalid-name, missing-docstring, unused-argument


def w(m):  # Invalid function and argument name
    a = 1655
    b = 12
    return a + b


# Missing docstring for function


class MyClass:
    def __init__(self):
        self.var = 1

    def my_method(self):  # Method with no docstring
        return self.var
