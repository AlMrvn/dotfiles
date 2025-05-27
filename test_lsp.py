def greet(name: str) -> str:
    """
    A simple greeting function.
    
    Args:
        name (str): The name to greet
        
    Returns:
        str: A greeting message
    """
    return f"Hello, {name}!"

# Test the function
message = greet("World")
print(message)

# This should show type hints and completions
class Person:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age
    
    def get_info(self) -> str:
        return f"{self.name} is {self.age} years old"

# Create an instance
person = Person("Alice", 30)
# Try typing 'person.' here to test completions 