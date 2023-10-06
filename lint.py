# lint.py
import pylint.lint
import subprocess

def lint_and_fix_python_code(file_path):
    # Customize pylint options as needed
    pylint_opts = [
        '--rcfile=pylintrc',  # Path to your pylint configuration file
        '--load-plugins', 'pylint.extensions.mccabe',
        file_path,
    ]

    # Run pylint and return its exit code
    exit_code = pylint.lint.Run(pylint_opts).linter.msg_status

    # Automatically fix linting issues using autopep8
    subprocess.run(["autopep8", "--in-place", "--aggressive", file_path])

    return exit_code

if __name__ == "__main__":
    file_path = "factorial.py"  # Replace with your Python file path
    threshold = 7  # Set your linting threshold here

    exit_code = lint_and_fix_python_code(file_path)

    if exit_code >= threshold:
        print(f"Linting score ({exit_code}) is above or equal to the threshold ({threshold}).")
        exit(0)  # Exit with success code
    else:
        print(f"Linting score ({exit_code}) is below the threshold ({threshold}).")
        subprocess.run(["git", "add", file_path])  # Add the file to the staging area
        subprocess.run(["git", "commit", "-m", "Linting and formatting fixes."])  # Commit the changes
        exit(0)  # Exit with success code
