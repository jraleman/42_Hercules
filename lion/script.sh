#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/10 17:08:55 by jaleman           #+#    #+#              #
#    Updated: 2017/02/10 17:08:56 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Checks if the user is root.
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root!"
	exit 1
fi

# Hashtag lines with deb cdrom:[*
#/etc/apt/sources.list

# Install OpenSSH server repository, assume "yes" as answer to all prompts and
# run non-interactively. This way, the user doesn't have to type 'y' every time.
apt-get install openssh-server -y

# Define the new port number.
PORT_NUMBER="9001"

# Create backup file of sshd_config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_BACKUP

# Looks for the line that has the port number, and replaces it with the new one.
sed -i "s/^Port .*/Port $PORT_NUMBER/g" /etc/ssh/sshd_config

# Shows the user that the port number has changed.
echo "New SSH Port number: $PORT_NUMBER"

# Restart the SSH service with the new port number (defined by PORT_NUMBER).
/etc/init.d/ssh restart
