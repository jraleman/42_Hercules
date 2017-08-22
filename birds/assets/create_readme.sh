#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_readme.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:24:20 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:24:22 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 2 ] ; then
    echo "usage: sh $0 directory_path project_name"
# Echo into a README.md file a basic template on how to write a good README.md... lel
else
    DIRECTORY=$1
    PROJECT_NAME=$2
    {
        echo "# $PROJECT_NAME" > $DIRECTORY/README.md
        echo ""
        echo "## Synopsis" >> $DIRECTORY/README.md
        echo "At the top of the file there should be a short introduction and/ or overview that explains **what** the project is. This description should match descriptions added for package managers (Gemspec, package.json, etc.)" >> $DIRECTORY/README.md
        echo ""
        echo "## Code Example" >> $DIRECTORY/README.md
        echo "Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise." >> $DIRECTORY/README.md
        echo ""
        echo "## Motivation" >> $DIRECTORY/README.md
        echo "A short description of the motivation behind the creation and maintenance of the project. This should explain **why** the project exists." >> $DIRECTORY/README.md
        echo ""
        echo "## Installation" >> $DIRECTORY/README.md
        echo "Provide code examples and explanations of how to get the project." >> $DIRECTORY/README.md
        echo ""
        echo "## API Reference" >> $DIRECTORY/README.md
        echo "Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live." >> $DIRECTORY/README.md
        echo ""
        echo "## Tests" >> $DIRECTORY/README.md
        echo "Describe and show how to run the tests with code examples." >> $DIRECTORY/README.md
        echo ""
        echo "## Contributors" >> $DIRECTORY/README.md
        echo "Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable." >> $DIRECTORY/README.md
        echo ""
        echo "## License" >> $DIRECTORY/README.md
        echo "A short snippet describing the license (MIT, Apache, etc.)" >> $DIRECTORY/README.md

    } &> /dev/null
fi
    exit 0
