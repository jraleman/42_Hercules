#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    validate.py                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/14 14:39:31 by jaleman           #+#    #+#              #
#    Updated: 2017/04/14 14:39:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import re

def validate_email(EMAIL_USER):
    """
    Makes sure if the emails passed as parameter is valid.
    If invalid, returns 'None'.
    """

    return re.match("[\.\w]{2,}[@]\w+[.]\w+", EMAIL_USER)
