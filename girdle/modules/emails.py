#!/usr/bin/python
# -*- coding: utf-8 -*-

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    emails.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/14 14:39:31 by jaleman           #+#    #+#              #
#    Updated: 2017/04/14 14:39:32 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import the required modules.
from email import encoders
from email.MIMEBase import MIMEBase
from email.mime.text import MIMEText
from email.MIMEMultipart import MIMEMultipart

def to_army(EMAIL_USER, EMAIL_ADDR):
    """
    First (1st) email, Hercules sends an email to the army.
    """

    msg = MIMEMultipart()
    msg['To'] = EMAIL_USER
    msg['From'] = EMAIL_ADDR
    msg['Subject'] = "HERCULES: TO ALL MY FRIENDS"
    body = open('assets/to_army.html', 'r').read()
    msg.attach(MIMEText(body, 'html'))
    return msg.as_string()

def to_hippolyte(EMAIL_USER, EMAIL_ADDR):
    """
    Second (2nd) email, Hercules sends an email to Hippolyte.
    """

    msg = MIMEMultipart()
    msg['To'] = EMAIL_USER
    msg['From'] = EMAIL_ADDR
    msg['Subject'] = "HERCULES: TO HIPPOLYTE"
    body = open('assets/to_hippolyte.html', 'r').read()
    msg.attach(MIMEText(body, 'html'))
    return msg.as_string()

def from_army(EMAIL_USER, EMAIL_ADDR):
    """
    Third (3th) email, the army replies to Hercules.
    """

    msg = MIMEMultipart()
    msg['To'] = EMAIL_USER
    msg['From'] = EMAIL_ADDR
    msg['Subject'] = "COUNT WITH US HERCULES!!!"
    body = open('assets/from_army.html', 'r').read()
    msg.attach(MIMEText(body, 'html'))
    return msg.as_string()

def from_hippolyte(EMAIL_USER, EMAIL_ADDR):
    """
    Fourth (4th) email, Hippolyte replies to Hercules.
    """
	
    msg = MIMEMultipart()
    msg['To'] = EMAIL_USER
    msg['From'] = EMAIL_ADDR
    msg['Subject'] = "Hippolyte: To Hercules"
    body = open('assets/from_hippolyte.html', 'r').read()
    msg.attach(MIMEText(body, 'html'))
    return msg.as_string()

def gg_email(EMAIL_USER, EMAIL_ADDR):
    """
    Fifth (5th) and last email, Hercules replies to all.
    """

    msg = MIMEMultipart()
    msg['To'] = EMAIL_USER
    msg['From'] = EMAIL_ADDR
    msg['Subject'] = "HERCULES: HAHAHAHA!!1 DIZ IS OVER NUBS"
    body = open('assets/gg_email.html', 'r').read()
    msg.attach(MIMEText(body, 'html'))
    return msg.as_string()
