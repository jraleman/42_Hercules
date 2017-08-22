#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_author.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:23:36 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:23:37 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 1 ] ; then
    echo "usage: sh $0 directory_path"
else
    DIRECTORY=$1
    echo $USER > $DIRECTORY/author
fi
    exit 0
