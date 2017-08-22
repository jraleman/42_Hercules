#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    include_libft.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:24:31 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:24:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 1 ] ; then
    echo "usage: sh $0 libft_path"
# Make libft directory inside the project directory, and asks the user to input
# the path of libft to copy the content into the new libft directory inside the
# project directory. SUCH A LONG ASS COMMENT! LOL :)
else
    DIRECTORY=$1
    mkdir -p $DIRECTORY/libft
    read -p "Specify libft location: ~/" libft_path
    cp -R ~/$libft_path/* "$DIRECTORY/libft"
fi
    exit 0
