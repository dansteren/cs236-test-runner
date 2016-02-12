#!/bin/bash
LAB="lab-2"
INPUT=test/$LAB/input/
ACTUAL=test/$LAB/actual/
EXPECT=test/$LAB/expect/

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0m'

case $1 in
  -h|--help)
    man ./manpage
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
  -d|--download-tests)
    printf "Downloading Test Cases... ["

    #see http://askubuntu.com/questions/161778/how-do-i-use-wget-curl-to-download-from-a-site-i-am-logged-into

    # lab-1 test cases
    LAB="lab-1"
    INPUT=test/$LAB/input/
    EXPECT=test/$LAB/expect/
        # input
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in10.txt --create-dirs -o $INPUT/10
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in11.txt --create-dirs -o $INPUT/11
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in12.txt --create-dirs -o $INPUT/12
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in13.txt --create-dirs -o $INPUT/13
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in14.txt --create-dirs -o $INPUT/14
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in15.txt --create-dirs -o $INPUT/15
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in61.txt --create-dirs -o $INPUT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/in62.txt --create-dirs -o $INPUT/62
            echo -n "="
        # expect
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out10.txt --create-dirs -o $EXPECT/10
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out11.txt --create-dirs -o $EXPECT/11
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out12.txt --create-dirs -o $EXPECT/12
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out13.txt --create-dirs -o $EXPECT/13
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out14.txt --create-dirs -o $EXPECT/14
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out15.txt --create-dirs -o $EXPECT/15
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out61.txt --create-dirs -o $EXPECT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab1/out62.txt --create-dirs -o $EXPECT/62
            echo -n "="
    # lab-2 test cases
    LAB="lab-2"
    INPUT=test/$LAB/input/
    EXPECT=test/$LAB/expect/
        # input
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in21.txt --create-dirs -o $INPUT/21
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in22.txt --create-dirs -o $INPUT/22
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in23.txt --create-dirs -o $INPUT/23
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in24.txt --create-dirs -o $INPUT/24
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in25.txt --create-dirs -o $INPUT/25
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in25.txt --create-dirs -o $INPUT/25
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in25.txt --create-dirs -o $INPUT/25
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in25.txt --create-dirs -o $INPUT/25
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in61.txt --create-dirs -o $INPUT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/in62.txt --create-dirs -o $INPUT/62
            echo -n "="
        # expect
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out21.txt --create-dirs -o $EXPECT/21
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out22.txt --create-dirs -o $EXPECT/22
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out23.txt --create-dirs -o $EXPECT/23
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out24.txt --create-dirs -o $EXPECT/24
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out25.txt --create-dirs -o $EXPECT/25
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out25.txt --create-dirs -o $EXPECT/25
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out25.txt --create-dirs -o $EXPECT/25
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out25.txt --create-dirs -o $EXPECT/25
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out61.txt --create-dirs -o $EXPECT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab2/out62.txt --create-dirs -o $EXPECT/62
            echo -n "="
    # lab-3 test cases
    LAB="lab-3"
    INPUT=test/$LAB/input/
    EXPECT=test/$LAB/expect/
        # input
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in30.txt --create-dirs -o $INPUT/30
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in33.txt --create-dirs -o $INPUT/33
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in35.txt --create-dirs -o $INPUT/35
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in36.txt --create-dirs -o $INPUT/36
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in37.txt --create-dirs -o $INPUT/37
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in61.txt --create-dirs -o $INPUT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/in62.txt --create-dirs -o $INPUT/62
            echo -n "="
        # expect
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out30.txt --create-dirs -o $EXPECT/30
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out33.txt --create-dirs -o $EXPECT/33
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out35.txt --create-dirs -o $EXPECT/35
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out36.txt --create-dirs -o $EXPECT/36
            echo -n "="
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out37.txt --create-dirs -o $EXPECT/37
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out61.txt --create-dirs -o $EXPECT/61
            curl -s --cookie cookies.txt http://beta.cs.byu.edu/~cs236/tests/lab3/out62.txt --create-dirs -o $EXPECT/62
            echo -n "="
    # lab-4 test cases
        # input
        # expect
    # lab-5 test cases
        # input
        # expect
    LAB="lab-2"
    INPUT=test/$LAB/input/
    EXPECT=test/$LAB/expect/
    printf "]\n${GREEN}All Test Cases Downloaded!${WHITE}\n"
  ;;
  -v|--version)
    echo "0.1.2"
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
