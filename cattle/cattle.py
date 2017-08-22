#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    cattle.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/22 03:53:25 by jaleman           #+#    #+#              #
#    Updated: 2017/04/22 03:53:26 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import sys
from gevent.pool import Pool
from modules.test import stress_test
from modules.validate import validate_url
from modules.directory import create_directory
from modules.logs import create_log
#from modules.progress import progress_bar

# Print usage message if the number of arguments isn't valid.
if len(sys.argv) != 4:
    print ("usage: python " + sys.argv[0] + " [url] [threads] [times]")
    sys.exit(0)

# Makes sure if the url is valid.
# On error, shows a message to the user.
if validate_url(sys.argv[1]) == None:
    print ("Error: " + sys.argv[1] + " is not a valid url! (╯°□°）╯")
    print ("Have you included the protocol? e.g.: http://")
    sys.exit(1)
else:
    url = sys.argv[1]

# Asks for user input (an integer).
# On error, shows a message to the user.
try:
    threads = int(sys.argv[2])
    times = int(sys.argv[3])
except ValueError:
    print ("Enter an integer, please! (╯°□°）╯")
    sys.exit(1)
except:
    pass

# Shows a nice message to the user. :)
print ("Starting benchmark... (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧")
print ("Requesting from " + url)

# Starts a pool thread with n number of workers (threads).
pool = Pool(threads)

# Gets the status of every request, and store them as a list.
# for i in progress_bar(range(times), "Loading: ", "🐮 ", " 🌿", 25):
status = pool.map(stress_test, [url] * times)

# Prints the status code, followed by the number of times repeated.
result = dict((i, status.count(i)) for i in status)

# Create a directory (if it doesn't exist) called "logs".
# Store the log file in it.
create_directory("./logs/")
log = create_log("./logs/", result, url)
print ("Benchmark done! Check your log file: " + log)
