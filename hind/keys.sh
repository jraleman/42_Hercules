#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    keys.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/24 14:32:07 by jaleman           #+#    #+#              #
#    Updated: 2017/02/24 14:32:08 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

cp ~/.zshrc ~/.zshrc_backup

echo "export FINDER42_UID=422778f11ebed34cb34e4e3996ed396592a120364f161508adb04a36f6df57c5" \
>> ~/.zshrc
echo "export FINDER42_SECRET=e13f9e42ef449eea7dc9cf0bb560472d2107db2aaa759997bb44d299eaf013e3" \
>> ~/.zshrc

zsh
