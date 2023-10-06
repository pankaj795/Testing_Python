# lint.py
import pylint.lint

def lint_python_code(file_path):
    # Customize pylint options as needed
    pylint_opts = [
        '--rcfile=pylintrc',  # Path to your pylint configuration file
        file_path,
    ]
    
    # Run pylint and return its exit code
    exit_code = pylint.lint.Run(pylint_opts).linter.msg_status
    return exit_code

if __name__ == "__main__":
    file_path = "factorial.py"  # Replace with your Python file path
    threshold = 7  # Set your linting threshold here

    exit_code = lint_python_code(file_path)

    if exit_code >= threshold:
        print(f"Linting score ({exit_code}) is above or equal to the threshold ({threshold}).")
        exit(0)  # Exit with success code
    else:
        print(f"Linting score ({exit_code}) is below the threshold ({threshold}).")
        exit(1)  # Exit with failure code
