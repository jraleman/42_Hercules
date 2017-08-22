#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    abort_ponies.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/07/07 09:03:09 by jaleman           #+#    #+#              #
#    Updated: 2017/07/07 09:03:11 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Kill the horsies :(
kill -s KILL $(pgrep say osascript)
kill -s KILL $(top -l 1 | grep ponies | awk '{print $1}')

# Remove all the .gg files made by manger
rm -Rf *.gg
