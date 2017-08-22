#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    progress.py                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/22 03:53:25 by jaleman           #+#    #+#              #
#    Updated: 2017/04/22 03:53:26 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import sys

def progress_bar(it, prefix, fill, empty, size):
    """
    Draws a progress bar, with the number of iterators that provide a length.
    Source: http://stackoverflow.com/a/34482761
    """

    count = len(it)
    def _show(_i):
        x = int(size * _i / count)
        bar = (prefix, fill * x, empty * (size - x), _i, count)
        sys.stdout.write("%s[%s%s] %i/%i\r" % bar)
        sys.stdout.flush()

    _show(0)
    for i, item in enumerate(it):
        yield item
        _show(i + 1)
    sys.stdout.write("\n")
    sys.stdout.flush()
