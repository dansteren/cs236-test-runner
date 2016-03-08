# CS 236 Test Runner
A simple bash script to compile and test your CS 236 Projects

## About
Test.sh is a comprehensive test runner. It can test your project against a single test case or a whole folder, with the additional option to compile your program before testing. It comes packaged with the test cases from the [course website](http://beta.cs.byu.edu/~cs236/tests/tests.php).

##System Requirements
This test runner was designed for Linux systems, specifically Ubuntu, but should work just fine on macs as well. Windows users: sorry!

Also, the test runner checks code complexity using the pmccabe tool, and must be installed prior to use. If your distribution supports APT you can install pmccabe by running `sudo apt-get install pmccabe`.

## Get Started

1. Open a terminal and navigate to the root of your project `cd path/to/project-files`
2. Clone the test-runner repo: `git clone https://github.com/xaves/cs236-test-runner.git`
3. Navigate inside the repo `cd cs236-test-runner`
4. Make the file executable for your user: `chmod u+x test.sh`
5. Update path variables (if necessary): `./test.sh -u`
6. Run the script with any of the available options. `./test.sh <options>`


## Options

Test.sh can be run with various different options to provide additional functionality

    -c     compile the program before running tests
    -f     only test the file passed in
    -h     display help
    -p     run pmccabe only
    -u     update output paths
    -v     output version information

Example: `./test.sh -cf 21`

## Concerning Test files

The test runner comes packaged with the test files provided on the [course website](http://beta.cs.byu.edu/~cs236/tests/tests.php). Any additional tests you wish to run will have to be created manually.
