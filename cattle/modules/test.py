#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.py                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/22 03:53:25 by jaleman           #+#    #+#              #
#    Updated: 2017/04/22 03:53:26 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import sys
import requests

def stress_test(url):
    """
    Gets a request code from a url.
    If there's an error, abort everything!
    """

    try:
        return requests.head(url).status_code
    except:
        return "ERROR"
