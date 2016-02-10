#!/bin/bash
LAB="lab-2"
case $1 in
  -h|--help)
    echo "TEST(7)                             test.sh                            TEST(7)"
    echo ""
    echo "NAME"
    echo "       test.sh - test your project against a series of test cases"
    echo ""
    echo "SYNOPSIS"
    echo "       ./test.sh [OPTION]... [FILE]"
    echo ""
    echo "DESCRIPTION"
    echo "       test.sh is a comprehensive test runner. It can test your project"
    echo "       against a single test case or a whole folder, with the additional"
    echo "       option to compile your program before testing."
    echo ""
    echo "OPTIONS"
    echo "       -c     compile the program before running tests"
    echo ""
    echo "       -f     only test the file passed in"
    echo ""
    echo "       -v     output version information and exit"
    echo ""
    echo "       -h     display this help and exit"
    echo ""
    echo ""
  ;;
  -v|--version)
    echo "0.1.0"
  ;;
  -cf|-fc|-f)
    if [ "$1" == "-cf" ]||[ "$1" == "-fc" ]
      then
        echo "Compiling project..."
        g++ -g -Wall -std=c++11 *.cpp -o project
    fi
    FILE=$2
    if [ "$2" == "" ]
      then
        echo -n "Enter file number: "
        read FILE
    fi
    if [ -f test/$LAB/input/$FILE ];
      then
        #  echo "File $FILE exists."
        ./project test/$LAB/input/$FILE test/$LAB/actual/$FILE
        DIFF=$(diff test/$LAB/expect/$FILE test/$LAB/actual/$FILE)
        RED='\033[0;31m'
        GREEN='\033[0;32m'
        WHITE='\033[0m'
        if [ "$DIFF" != "" ]
        then
            printf "Test $FILE......${RED}FAILED${WHITE}\n"
          else
            printf "Test $FILE......${GREEN}PASSED${WHITE}\n"
        fi
      else
         echo "File '$FILE' does not exist. All tests must be located in './test/lab-#/input'"
    fi
  ;;
  ""|-c)
    if [ "$1" == "-c" ]
      then
        echo "Compiling project..."
        g++ -g -Wall -std=c++11 *.cpp -o project
    fi
    for FILE in $(ls test/$LAB/input/)
    do
      ./project test/$LAB/input/$FILE test/$LAB/actual/$FILE
      DIFF=$(diff test/$LAB/expect/$FILE test/$LAB/actual/$FILE)
      RED='\033[0;31m'
      GREEN='\033[0;32m'
      WHITE='\033[0m'
      if [ "$DIFF" != "" ]
      then
          printf "Test $FILE......${RED}FAILED${WHITE}\n"
        else
          printf "Test $FILE......${GREEN}PASSED${WHITE}\n"
      fi
    done
  ;;
  *)
    echo "invalid options"
  ;;
esac
