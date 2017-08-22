#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    crontab-script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/03 10:46:49 by jaleman           #+#    #+#              #
#    Updated: 2017/03/03 10:46:50 by jaleman          ###   ########.fr        #
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
# See: man 5 crontab || http://www.nncron.ru/help/EN/working/cron-format.htm
MONTH="12"
DAY="21"
HOUR="8"
MIN="42"

# Define the script to be run for the cron job.
BOAR_SCRIPT="$BOAR_CMD ~/.$BOAR_DIR/$BOAR_FILES"
BOAR_JOB="$MIN $HOUR $DAY $MONTH * $BOAR_SCRIPT"

# Creates a new crontab for the user if none is found.
# Adds the job to the crontab, with no duplication.
# 2>/dev/null hides the [no crontab for X] pesky message.
(crontab -u $LOGNAME -l 2>/dev/null | \
grep -v -F "$BOAR_SCRIPT" ; echo "$BOAR_JOB") | crontab -

# Shows the current crontab for the user
echo -n "Job added to the crontab: "
crontab -u $LOGNAME -l

# Outputs the date and time of the execution.
echo "The Boar Script will be executed at $(date +"%Y")-$MONTH-$DAY $HOUR:$MIN"
