# CS 236 Test Runner
Compile and test your CS 236 projects

## About
CS 236 Test Runner is a comprehensive build tool and test runner. It can test your project against a single test case, or a whole folder. Additionally it can check code complexity, and compile your program for you. It comes packaged with the test cases from the [course website](http://beta.cs.byu.edu/~cs236/tests/tests.php).

## System Requirements
This test runner was designed for Linux systems, specifically Ubuntu, but should work just fine on macs as well. Windows users: sorry!

The test runner attempts to check code complexity using the pmccabe tool. In order to have this functionality, pmccabe must be installed (though the program will still still do everything else if it isn't installed). If your distribution supports APT you can install pmccabe by running `sudo apt-get install pmccabe`.

## Get Started

1. Open a terminal and navigate to the root of your project `cd path/to/project-files`
2. Clone the test-runner repo: `git clone https://github.com/xaves/cs236-test-runner.git`
3. Navigate inside the repo `cd cs236-test-runner`
4. Make the file executable for your user: `chmod u+x test`
5. Update path variables (if necessary): `./test -u`
6. Run the script with any of the available options. `./test <options>`


## Options

Test can be run with various different options to provide additional functionality

    -c     compile the program before running tests
    -f     only test the file passed in
    -h     display help
    -p     run pmccabe only
    -u     update output paths
    -v     output version information

Example: `./test -cf 21`

## Concerning Test files

The test runner comes packaged with the test files provided on the [course website](http://beta.cs.byu.edu/~cs236/tests/tests.php). Any additional tests you wish to run will have to be created manually.
