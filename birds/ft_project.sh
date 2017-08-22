#!/bin/bash
# DO NOT FUCKING EDIT! DO NOT FUCKING EDIT! DO NOT FUCKING EDIT! DO NOT FUCKING
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_project.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:20:02 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:20:03 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# HILFE! :D
if [[ ("$1" == "-h" || "$1" == "--help") && $# == 1 ]] ; then
    sh ./assets/help.sh
# Install this script so it can be used anywhere! :D
elif [[ ("$1" == "-i" || "$1" == "--install") && $# == 1 ]] ; then
    sh ./assets/install.sh
# Create a project! :D
elif [[ ("$1" == "-c" || "$1" == "--create") && $# == 2 ]] ; then

	# Intro screen I believe...? :)
	clear
	echo "███████╗████████╗     ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗"
	echo "██╔════╝╚══██╔══╝     ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝"
	echo "█████╗     ██║        ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║"
	echo "██╔══╝     ██║        ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║"
	echo "██║        ██║███████╗██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║"
	echo "╚═╝        ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝"
	echo ""

    # Convert the project name to lowercase.
    PROJECT=$( echo "$2" | tr '[:upper:]' '[:lower:]' )
    echo "Name of the project: $PROJECT"

    # 1. Create directory with project name.
    DIRECTORY=./$PROJECT$sp$n
    {
        # If folder exists, add a number after its name.
        while ! mkdir $DIRECTORY
        do
            sp="_"
            n=$(printf "%03d" $(( 10#$n + 1 )) )
            DIRECTORY=./$PROJECT$sp$n
        done
    } &> /dev/null
    echo "Project path: ${PWD/#$HOME/~}"/$PROJECT

    # 2. Asks for programming language (force C language... lel)
    read -p "What programming language will you be developing in?: " LANG
    LANG=$( echo "$LANG" | tr '[:upper:]'  '[:lower:]' )
    if [[ "$LANG" == "c" ]]; then
        echo "Good choice! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧"
    elif (grep -Fxq "$LANG" ./assets/language-list.txt) ; then
        echo "I don't care... I'm gonna choose C! ¯\_(ツ)_/¯"
    else
        echo "Wtf is $LANG?! I'm gonna choose C for you! ¯\_(ツ)_/¯"
    fi
    sh ./assets/create_project.sh $DIRECTORY $PROJECT

    # 3. Asks and copy libft folder into project folder.
    while true; do
        read -p "Do you want to include your libft? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/include_libft.sh $DIRECTORY; LIBFT=1; break;;
            [Nn]* ) LIBFT=0; break;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done

    # 4. Asks for Makefile creation.
    while true; do
        read -p "Generate a Makefile file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/create_makefile.sh $DIRECTORY $PROJECT $LIBFT; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done

    # 5. Asks for author file creation.
    while true; do
        read -p "Generate author file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/create_author.sh $DIRECTORY; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done

    # 6. Asks for .gitignore file creation.
    while true; do
        read -p "Generate .gitignore file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/create_gitignore.sh $DIRECTORY; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done

    # 7. Asks for README.md file creation.
    while true; do
        read -p "Generate README.md file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/create_readme.sh $DIRECTORY $PROJECT; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done

    clear
    echo "Project $PROJECT has been created!"
# Usage message if number of arguments are invalid or invalid flag.
else
    echo "usage: sh $0 [-h | --help] [-c | --create project_name] [--install]"
fi
    exit 0
