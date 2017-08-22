#!/usr/bin/ruby

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    finder42.rb                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/24 14:32:07 by jaleman           #+#    #+#              #
#    Updated: 2017/02/24 14:32:08 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Required files.
require "oauth2"
require "./includes/colors.rb"

# Create the client with the credentials (user id and secret key),
# get an access token.
# FINDER42_UID    : YOUR USER ID
# FINDER42_SECRET : YOUR SECRET KEY
$client = OAuth2::Client.new(
ENV['FINDER42_UID'],
ENV['FINDER42_SECRET'],
site: "https://api.intra.42.fr")
$token = $client.client_credentials.get_token

# Checks if the response is valid. If it fails to connect, will retry
# to connect every five (5) seconds until it connects (get a status 200).
def find_user(login)
  begin
    response = $token.get("/v2/users/#{login}/locations")
    while response.status != 200
      puts ("Server are down? lol idk... Let's try again... (ᴗ˳ᴗ)").brown
      sleep(5)
      if response.status == 200
        break
      end
    end
    if !response.parsed[0]["end_at"]
      puts (login.ljust(10) + ": " + response.parsed[0]["host"]).green
    else
      puts (login.ljust(10) + ": not logged in ¯\\_(ツ)_/¯").cyan
      puts ("(last login -> " + response.parsed[0]["host"] + ")").blue
    end
  rescue
    puts (login.ljust(10) + ": not a valid username!").red
  end
end

# Open text file (makes sure it's valid), and loop every line in the file
# Remove whitespaces from every user login, to parse them correctly into the
# find_user() function. If there are no parameters, prints the usage of
# the program.
if ARGV[0]
  if File.file?(ARGV[0]) and File.extname(ARGV[0]) == ".txt"
    file = File.open(ARGV[0], "r").each_line do |line|
      line == "\n" ? next : login = line.strip
      find_user(login)
    end
    file.close
  else
    puts "Invalid file! (╯°□°）╯︵ ┻━┻"
  end
else
  puts "usage: " + $PROGRAM_NAME + " [file.txt]"
end
