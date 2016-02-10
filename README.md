# CS 236 Test Runner
A simple bash script to compile and test your CS 236 Projects

## About
Test.sh is a comprehensive test runner. It can test your project against a single test case or a whole folder, with the additional option to compile your program before testing.

## Get Started

### Setup your environment

Test.sh has been designed to work with a specific folder structure. In order to use the script you will either need to setup your folder structure the same as it's requirements, or you will need to modify the script to point to the correct locations.

The script is setup to work with a file structure like the following:


    .                           # The root directory for your project
    ├── ...
    ├── project.cpp             # Main .cpp file to be compiled into an executable
    ├── test                    # Test files (contains all tests)
    │   ├── lab-1               # Lab 1 specific tests
    │       ├── actual          # Outputs from your executable
    │           ├── 1           # Output 1
    │           ├── 2           # Output 2
    │           └── 3           # Output 3
    │       ├── expect          # Expected outputs downloaded from course website
    │           ├── 1           # Expected Output 1
    │           ├── 2           # Expected Output 2
    │           └── 3           # Expected Output 3
    │       └── input           # Test cases to be read as inputs
    │           ├── 1           # Test Case 1
    │           ├── 2           # Test Case 2
    │           └── 3           # Test Case 3
    │   ├── lab-2               # Lab 2 specific tests
    │   └── ...                 # Unit tests
    └── ...

NOTE: Future versions may allow you to choose your test case file paths.

Once you have the correct file structure, do the following:

1. `git clone https://github.com/xaves/cs236-test-runner.git`
2. Copy the file into the root of your project directory
3. Make the file executable for your user: `chmod u+x test.sh`
4. Run the script with any of the available options. `./test.sh <options>`


### Options

 - `-c`     compile the program before running tests
 - `-f`     only test the file passed in
 - `-v`     output version information
 - `-h`     display help

Example: `./test.sh -cf 21`
