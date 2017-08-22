#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    girdle.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/14 14:39:31 by jaleman           #+#    #+#              #
#    Updated: 2017/04/14 14:39:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
import os
import sys
import base64
from modules.send import send_emails
from modules.validate import validate_email

# Print usage message if the number of arguments isn't valid.
if len(sys.argv) != 2:
    print "usage: python " + sys.argv[0] + " email_address"
    sys.exit(0)

# Save the user's email into a constant variable.
EMAIL_USER = sys.argv[1]
EMAIL_SERV = "smtp.zoho.com"
EMAIL_ADDR = os.environ['EMAIL_ADDR']
EMAIL_PASS = base64.b64decode(os.environ['EMAIL_PASS'])

# Sends the email, but
# If the email is not valid, displays an error message.
if validate_email(EMAIL_USER) == None:
    print "Error: That's not a valid email! (╯°□°）╯"
    sys.exit(1)
else:
    print "Sending emails, please wait a moment... (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧"
    send_emails(EMAIL_USER, EMAIL_SERV, EMAIL_ADDR, EMAIL_PASS)
