#!/bin/bash
LAB="lab-2"
INPUT=test/$LAB/input/
ACTUAL=test/$LAB/actual/
EXPECT=test/$LAB/expect/

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'

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
    echo "       -u     update output paths"
    echo ""
    echo "       -c     compile the program before running tests"
    echo ""
    echo "       -f     only test the file passed in"
    echo ""
    echo "       -v     output version information and exit"
    echo ""
    echo "       -h     display this help and exit"
  ;;
  -u|--update)
    echo "Updating File Paths (leave field empty to skip)"
    echo -n "    Lab Number: "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '2s|.*|LAB="lab-'$DIR'"|' test.sh
        DIR=""
    fi

    echo -n "    Path to input files (i.e. test/lab-1/input): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '3s|.*|INPUT='$DIR'/|' test.sh
        DIR=""
    fi

    echo -n "    Path to actual outputs (i.e. test/lab-1/actual): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '4s|.*|ACTUAL='$DIR'/|' test.sh
        DIR=""
    fi

    echo -n "    Path to expected outputs (i.e. test/lab-1/expect): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '5s|.*|EXPECT='$DIR'/|' test.sh
        DIR=""
    fi
    printf "${GREEN}    UPDATE COMPLETE!${WHITE}\n"
  ;;
  -v|--version)
    echo "0.1.1"
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
        echo -n "Enter file name: "
        read FILE
    fi
    if [ -f $INPUT$FILE ];
      then
        #  echo "File $FILE exists."
        ./project $INPUT$FILE $ACTUAL$FILE
        DIFF=$(diff $EXPECT$FILE $ACTUAL$FILE)
        if [ "$DIFF" != "" ]
        then
            printf "Test $FILE......${RED}FAILED${WHITE}\n"
          else
            printf "Test $FILE......${GREEN}PASSED${WHITE}\n"
        fi
      else
         echo "File '$FILE' does not exist. All tests must be located in '$INPUT'"
    fi
  ;;
  ""|-c)
    if [ "$1" == "-c" ]
      then
        echo "Compiling project..."
        g++ -g -Wall -std=c++11 *.cpp -o project
    fi
    for FILE in $(ls $INPUT)
    do
      ./project $INPUT$FILE $ACTUAL$FILE
      DIFF=$(diff $EXPECT$FILE $ACTUAL$FILE)
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
