#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:25:15 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:25:16 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Make a directory to store all the fucking assets
mkdir -p ~/.ft_project
if [ $? -ne 0 ] ; then
    echo "Failed to create script directory, try again!"
    exit 1
fi

# Copy file, assets to the ft_project directory, and make a backup of .zshrc
cp -R ./ft_project.sh ~/.ft_project
cp -R ./assets/* ~/.ft_project
cp ~/.zshrc ~/.zshrc-backup

# Change permision
chmod -R 775 ~/.ft_project

# Replaces all the paths to home paths ~/
# THIS IS VERY FUCKING HACKIGN!!!!! FIX ASAP!
ex -sc '17c|sh ~/.ft_project/help.sh' -cx ~/.ft_project/ft_project.sh
ex -sc '20c|sh ~/.ft_project/install.sh' -cx ~/.ft_project/ft_project.sh
ex -sc '61c|sh ~/.ft_project/create_project.sh $DIRECTORY $PROJECT' -cx ~/.ft_project/ft_project.sh
ex -sc '56c|elif (grep -Fxq "$LANG" ~/.ft_project/language-list.txt) ; then' -cx ~/.ft_project/ft_project.sh
ex -sc '67c|[Yy]* ) sh ~/.ft_project/include_libft.sh $DIRECTORY; LIBFT=1; break;;' -cx ~/.ft_project/ft_project.sh
ex -sc '77c|[Yy]* ) sh ~/.ft_project/create_makefile.sh $DIRECTORY $PROJECT $LIBFT; break;;' -cx ~/.ft_project/ft_project.sh
ex -sc '87c|[Yy]* ) sh ~/.ft_project/create_author.sh $DIRECTORY; break;;' -cx ~/.ft_project/ft_project.sh
ex -sc '97c|[Yy]* ) sh ~/.ft_project/create_gitignore.sh $DIRECTORY; break;;' -cx ~/.ft_project/ft_project.sh
ex -sc '107c|[Yy]* ) sh ~/.ft_project/create_readme.sh $DIRECTORY $PROJECT; break;;' -cx ~/.ft_project/ft_project.sh

# Generate Header!!!
ex -sc '29c|sh ~/.ft_project/generate_header.sh "$PROJECT.c" "$DIRECTORY/srcs/main.c" "c"' -cx ~/.ft_project/create_project.sh
ex -sc '40c|sh ~/.ft_project/generate_header.sh "$PROJECT.h" "$DIRECTORY/includes/${PROJECT}.h" "c"' -cx ~/.ft_project/create_project.sh
ex -sc '24c|sh ~/.ft_project/generate_header.sh "Makefile" "$DIRECTORY/Makefile" "script"' -cx ~/.ft_project/create_makefile.sh
ex -sc '72c|sh ~/.ft_project/generate_header.sh "Makefile" "$DIRECTORY/Makefile" "script"' -cx ~/.ft_project/create_makefile.sh

# Replaces usage
# AGAIN! THIS IS FUCKING HACKING!!!!!!
ex -sc '117c|echo "usage: ft_project project_name"' -cx ~/.ft_project/ft_project.sh

# Add line to the profile to run this mother fucker! :D
if (grep -q -F 'alias ft_project="sh ~/.ft_project/ft_project.sh -c "' ~/.zshrc) ; then
    echo "ft_project is already installed! ᕕ( ᐛ )ᕗ"
else
    # Done! :)
    echo 'alias ft_project="sh ~/.ft_project/ft_project.sh -c "' >> ~/.zshrc
    echo "Restart your session!"
fi
