#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    directory.py                                       :+:      :+:    :+:    #
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

def create_directory(path):
    """
    Create the directory, but if it exists, ignore the error.
    However, any other error gets reported.
    Source: http://stackoverflow.com/a/5032238
    """

    try:
        os.makedirs(path)
    except OSError as exception:
        if exception.errno != errno.EEXIST:
            raise
