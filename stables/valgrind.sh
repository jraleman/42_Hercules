#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    valgrind.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/14 07:03:09 by jaleman           #+#    #+#              #
#    Updated: 2017/03/14 07:03:11 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 1 ] ; then
	echo "usage: sh $0 file.c"
	exit 1
fi

# Variables.
NAME="stables"
LOG="leaks.log"

# Compile the c file.
gcc -Wall -Wextra -Werror -o $NAME $1

# Run valgrind, check for memory leaks, and output the result in a log file.
valgrind --tool=memcheck --leak-check=yes --log-file=$LOG ./$NAME

# Open the log file.
cat $LOG

# Remove a folder that idk how to remove it? lel
rm -Rf $NAME.dSYM
