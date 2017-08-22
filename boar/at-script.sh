#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    at-script.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/03 18:06:31 by jaleman           #+#    #+#              #
#    Updated: 2017/03/03 18:06:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Define the command, files, and directory used to run the boar script.
# Edit if needed.
BOAR_CMD="DISPLAY=:0 firefox"
BOAR_DIR="boar"
BOAR_FILES="boar.html"

# Create the boar directory and boar files into the directory.
# If it fails making the directory, prints an error message and exit the script.
mkdir -p ~/.$BOAR_DIR
if [ $? -ne 0 ] ; then
	echo "Failed to create script directory, try again!"
	exit 1
fi
cp ./$BOAR_FILES ~/.$BOAR_DIR

# Set the correct date and time to run the task.
# Edit if needed.
# See: man 1 at || http://www.computerhope.com/unix/uat.htm
MONTH="12"
DAY="21"
HOUR="8"
MIN="42"
MER="AM"

# Add leading zeros (0) if variables are single digit.
if [ 1 -eq "${#MIN}" ] ; then
	MIN="0$MIN"
fi
if [ 1 -eq "${#HOUR}" ] ; then
	HOUR="0$HOUR"
fi
if [ 1 -eq "${#DAY}" ] ; then
	DAY="0$DAY"
fi
if [ 1 -eq "${#MONTH}" ] ; then
	MONTH="0$MONTH"
fi

# Define and set the script to be run at the specific date and time.
# The year will change depending on the current date.
YEAR="$(date +'%Y')"
CURRENT_DATE="$(date +'%Y-%m-%d')"
if [ $CURRENT_DATE \> $YEAR-$MONTH-$DAY ] ; then
	YEAR="$(date +'%Y') + 1 year"
fi
BOAR_SCRIPT="$BOAR_CMD ~/.$BOAR_DIR/$BOAR_FILES"
echo "$BOAR_SCRIPT" | at $HOUR:$MIN $MER $MONTH/$DAY/$YEAR

# Run this if you want to delete ALL the jobs:
# atq | sed 's_\([0-9]\{1,8\}\).*_\1_g' | xargs atrm

