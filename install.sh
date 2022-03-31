# !/bin/bash


#colors 
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

install_zsh () {
    if [ -f ~/.zshrc ]
    then
        echo " " >> ~/.zshrc
        echo "alias epitool='bash ~/.epitool.sh'" >> ~/.zshrc
        echo "${green}add to zshrc${reset}"
    fi
}

install_bash () {
    if [ -f ~/.bashrc ]
    then 
        echo " " >> ~/.bashrc
        echo "alias epitool='bash ~/.epitool.sh'" >> ~/.bashrc
        echo "${green}Done${reset}"
    else
        echo "${red}No bashrc file found${reset}"
    fi
}


#base
echo "installation..."
echo " "

if grep -q "alias epitool" ~/.bashrc
then 
    echo "${red}Epitool est déjà installer${reset}"
else
    cp epitool.sh ~/.epitool.sh
    install_zsh
    install_bash
fi