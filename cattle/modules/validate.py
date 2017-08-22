#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    validate.py                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/22 03:53:25 by jaleman           #+#    #+#              #
#    Updated: 2017/04/22 03:53:26 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import re

def validate_url(url):
    """
    Makes sure if the url passed as parameter is valid.
    If invalid, returns 'None'.
    Source: https://github.com/django/django/blob/master/django/core/validators.py#L47
    """

    regex = re.compile(
        r'^https?://'  # http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+[A-Z]{2,6}\.?|' # domain
        r'localhost|'  # localhost
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' # ... or ip
        r'(?::\d+)?'  # optional port
        r'(?:/?|[/?]\S+)$', re.IGNORECASE)
    return url is not None and regex.search(url)
