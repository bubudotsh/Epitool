#!/bin/bash
clear

#head and help
head () {
    echo "
 ______     ______   __     ______   ______     ______     __        
/\  ___\   /\  == \ /\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       
\ \  __\   \ \  _-/ \ \ \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  
 \ \_____\  \ \_\    \ \_\    \ \_\  \ \_____\  \ \_____\  \ \_____\ 
  \/_____/   \/_/     \/_/     \/_/   \/_____/   \/_____/   \/_____/ 
                                                                     
    "
}

help () {
    echo "NAME"
    echo "      epitool.sh - auto compliation and norm check"
    echo " "
    echo "INFO"
    echo "      - Your Makefile NOT GCC. He juste create Libmy.a"
    echo " "
    echo "SYNOPSIS"
    echo "      ./epitool.sh [OPTION] [TIME]"
    echo " "
    echo "DESCRIPTION"
    echo "      auto compliation and norm check"
    echo " "
    echo "OPTIONS"
    echo "      -t      [Time in seconds] loop time"
    echo " "
    echo "AUTHOR"
    echo "      Developped by Hugo Bunelier, Epitech students (promo 2026)"
    echo " "
    echo "EXEMPLE"
    echo "      ./epitool.sh -t 10"
    exit
}

# color
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

#variable
time=5
i=1
a=23

#functions
norm () {
    bubulle
}

check () {
    if [ -f Makefile ]
    then
        echo ""
    else
        echo "${red}you need Makefile${reset}"
        exit
    fi
}

makef () {
    if [ -f libmy.a ]
    then
        echo "Make..."
        echo -e "${green}DONE \u2714${reset}"
    else
        echo "Make..."
        echo -e "${red}Wrong \u2714${reset}"
    fi
}

open () {
    echo "***OUT***"
    echo " "
    ./a.out
    echo " "
    echo "***OUT***"
}

update () {
    echo "update..."
    echo " "
    git clone git@github.com:bubudotsh/Epitool.git 2> /dev/null 
    cp Epitool/epitool.sh ~/.epitool.sh
    rm -fr Epitool
    echo "${green}Done${reset}"
}


#options managment
while getopts "h:ut:" option; do
case $option in
    h)
        help
        exit;;
    u)
        update
        exit;;
    t)
        time=$OPTARG;;
    \?)
        echo "bad option, help : -h"
        exit;;
    esac
done

res=${pwd}
echo "${res}"

# #loop
# while [ $a -eq 23 ]
# do
#     check
#     head
#     norm
#     echo " "
#     make > /dev/null
#     makef
#     open
#     sleep ${time}
#     make fclean > /dev/null
#     clear
# done