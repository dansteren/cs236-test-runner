# CS 236 Test Runner
A simple bash script to compile and test your CS 236 Projects

## About
Test.sh is a comprehensive test runner. It can test your project against a single test case or a whole folder, with the additional option to compile your program before testing.

## Get Started

### Prep your Project

Test.sh has been designed to work with the following folder structure:


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

In order to use the script you will either need to setup your folder structure to match, or you will need to modify the script to point to the correct locations (step 4 below).

### Get the Test Runner

Once you have the correct file structure, do the following:

1. Clone the repo: `git clone https://github.com/xaves/cs236-test-runner.git`
2. Copy the file into the root of your project directory.
3. Make the file executable for your user: `chmod u+x test.sh`
4. Update the output paths (if necessary): `./test.sh -u`
5. [BETA!] Download the test files: `./test.sh -d`
6. Run the script with any of the available options. `./test.sh <options>`


## Options

Test.sh can be run with various different options that provide more functionality

    -u     update output paths
    -c     compile the program before running tests
    -d     download all test files from the course website [BETA!]
    -f     only test the file passed in
    -v     output version information
    -h     display help

Example: `./test.sh -cf 21`

## Getting Test files

Because students are required to come up with their own test cases all test cases will have to be download separately from the [course website](http://beta.cs.byu.edu/~cs236/tests/tests.php).

### [BETA FEATURE!] Download test cases with the script

An experimental feature has been added on the beta branch. It allows you to download all the test cases from the course website. You must have Firefox installed in order to use this feature. Future releases may eliminate the need for Firefox. To use, follow these steps:
1. Pull the latest changes from GitHub `git pull`
2. Checkout the beta branch `git checkout beta`
3. Install the [Export Cookies](https://addons.mozilla.org/en-US/firefox/addon/export-cookies/) Firefox add-on
4. Inside Firefox go to Tools > Export Cookies and save the cookies.txt file to the same location as test.sh
5. Run `./test.sh -d`
