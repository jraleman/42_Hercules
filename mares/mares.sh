#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mares.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/07/07 09:03:09 by jaleman           #+#    #+#              #
#    Updated: 2017/07/07 09:03:11 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Run the manger binary.
./assets/manger &

# Waits 15 seconds before executing the horse killers
sleep 15

# Kill all the horsies
# Used top because pgrep doesn't show all the process.
# Manger is like hidden or something xD
kill -s KILL $(pgrep crap lampon ruins xanthos yes)
kill -s KILL $(top -l 1 | grep manger | awk '{print $1}')

# Remove all the .poo files made by manger
rm -Rf *.poo

# Waits a bit before realising mah horsies
for i in {1..10}
do
  echo "SEIZURE WARNING!!!"
  sleep 1s
done
echo "RELEASE THE PONIES!"
sleep 2

# Compile and run my ponies
gcc ./assets/ponies.c -o ./assets/ponies
./assets/ponies &

# Waits a bit before killing them :(
sleep 12.5

# Goodnight, sweet prince.
sh ./assets/abort_ponies.sh
