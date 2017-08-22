#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    send.py                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/14 14:39:31 by jaleman           #+#    #+#              #
#    Updated: 2017/04/14 14:39:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import sys
import time
import smtplib
from emails import to_army, to_hippolyte, from_army, from_hippolyte, gg_email

def send_emails(EMAIL_USER, EMAIL_SERV, EMAIL_ADDR, EMAIL_PASS):
    """
    Sends five (5) emails telling the story of how our hero Hercules got the
    girdle from hippolyte.
    Waits two (2) seconds between each request, to make sure they arrive in
    order (but this may fail sometimes...  lel)
    If there is an error, display an error message and exit the program.
    """

    try:
        server = smtplib.SMTP_SSL('smtp.zoho.com', 465)
        server.login(EMAIL_ADDR, EMAIL_PASS)
        server.sendmail(EMAIL_ADDR, EMAIL_USER, to_army(EMAIL_USER, EMAIL_ADDR))
        time.sleep(2)
        server.sendmail(EMAIL_ADDR, EMAIL_USER, to_hippolyte(EMAIL_USER, EMAIL_ADDR))
        time.sleep(2)
        server.sendmail(EMAIL_ADDR, EMAIL_USER, from_army(EMAIL_USER, EMAIL_ADDR))
        time.sleep(2)
        server.sendmail(EMAIL_ADDR, EMAIL_USER, from_hippolyte(EMAIL_USER, EMAIL_ADDR))
        time.sleep(2)
        server.sendmail(EMAIL_ADDR, EMAIL_USER, gg_email(EMAIL_USER, EMAIL_ADDR))
        server.quit()
    except:
        print ("Error: Something went wrong! Try again later. ¯\_(ツ)_/¯")
        sys.exit(1)
