# lint.py
import pylint.lint
import subprocess
import os

def lint_and_fix_python_code(file_path):
    
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
    # Specify the directory containing your Python files
    directory_path = "/Testing_Python"

    # Set your linting threshold here
    threshold = 8

    # Iterate through files in the directory ovver all the directory................hjgjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjh
    for filename in os.listdir(directory_path):
        if filename.endswith(".py"):
            file_path = os.path.join(directory_path, filename)
            exit_code = lint_and_fix_python_code(file_path)
            
            print(f"Linting result for {filename}: {exit_code}")
            
            if exit_code >= threshold:
                print(f"Linting score ({exit_code}) is above or equal to the threshold ({threshold}).")
            else:
                print(f"Linting score ({exit_code}) is below the threshold ({threshold}).")
                subprocess.run(["git", "add", file_path])  # Add the file to the staging area
                subprocess.run(["git", "commit", "-m", "Linting and formatting fixes updated is successfukkt fknvkvneknvxczczczxzxczxczxczxcze."])  # Commit the changes
