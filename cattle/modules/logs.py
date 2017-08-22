#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    logs.py                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/22 03:53:25 by jaleman           #+#    #+#              #
#    Updated: 2017/04/22 03:53:26 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import os
import errno

def parse_log(content, url):
    """
    Parse the content into string, so it can be written into the log file.
    Ugly but it works! :D

    """
    percentage = (float(content.get(200, 0)) / sum(content.values())) * 100.00
    log = \
    "Result\n" + url + "\n\n" + \
    "HTTP Status Code                  Times\n" + \
    "200 OK  ----------------------->  " + str(content.get(200, 0)) + "\n" + \
    "400 Bad Request  -------------->  " + str(content.get(400, 0)) + "\n" + \
    "403 Forbidden  ---------------->  " + str(content.get(403, 0)) + "\n" + \
    "404 Not Found  ---------------->  " + str(content.get(404, 0)) + "\n" + \
    "405 Method Not Allowed  ------->  " + str(content.get(405, 0)) + "\n" + \
    "408 Request Timeout  ---------->  " + str(content.get(408, 0)) + "\n" + \
    "409 Conflict  ----------------->  " + str(content.get(409, 0)) + "\n" + \
    "429 Too Many Requests  -------->  " + str(content.get(429, 0)) + "\n" + \
    "500 Internal Server Error  ---->  " + str(content.get(500, 0)) + "\n" + \
    "502 Bad Gateway  -------------->  " + str(content.get(502, 0)) + "\n" + \
    "503 Service Unavailable  ------>  " + str(content.get(503, 0)) + "\n" + \
    "504 Gateway Time-out  --------->  " + str(content.get(504, 0)) + "\n" + \
    "Other  ------------------------>  " + str(content.get("ERROR", 0)) + \
    "\n\n================================\n" + \
    "Rating: " + str(percentage)+ "%\n"
    return log

def create_log(path, content, url):
    """
    Create a new log file.
    If a previous one exists, create a new one, with a new number.
    """

    i = 0
    filename = path + 'log_'+ str(i) + '.txt'
    while os.path.isfile(filename) is True:
        i += 1
        filename = path + 'log_' + str(i) + '.txt'
    with open(filename, 'w') as log:
        log.write(parse_log(content, url))
    return filename
