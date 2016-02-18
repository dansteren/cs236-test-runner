#!/bin/bash
LAB="lab-2"
INPUT=$LAB/input/
ACTUAL=$LAB/actual/
EXPECT=$LAB/expect/
PROJECT=../

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
        printf "${YELLOW}    The variable \$LAB now contains \"$LAB\". Feel free to use it below...${WHITE}\n"
        DIR=""
    fi

    echo -n "    Path to input files (i.e. \$LAB/input): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '3s|.*|INPUT='$DIR'/|' test.sh
        DIR=""
    fi

    echo -n "    Path to actual outputs (i.e. \$LAB/actual): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '4s|.*|ACTUAL='$DIR'/|' test.sh
        DIR=""
    fi

    echo -n "    Path to expected outputs (i.e. \$LAB/expect): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '5s|.*|EXPECT='$DIR'/|' test.sh
        DIR=""
    fi

    echo -n "    Path to project files (i.e. ../): "
    read DIR
    if [ "$DIR" != "" ]
      then
        sed -i '6s|.*|PROJECT='$DIR'/|' test.sh
        DIR=""
    fi
    printf "${GREEN}    UPDATE COMPLETE!${WHITE}\n"
    printf "${YELLOW}Note: paths can be updated manually by editing the variables on lines 1-6${WHITE}\n\n"
  ;;
  -v|--version)
    echo "0.1.2"
  ;;
  -cf|-fc|-f)
    if [ "$1" == "-cf" ]||[ "$1" == "-fc" ]
      then
        echo "Compiling project..."
        g++ -g -Wall -std=c++11 $PROJECT*.cpp -o project
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
        g++ -g -Wall -std=c++11 $PROJECT*.cpp -o project
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
