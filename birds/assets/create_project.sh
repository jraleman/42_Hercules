#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_project.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:25:58 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:25:59 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 2 ] ; then
    echo "usage: sh $0 directory_path project_name"
# Makes project directory structure, create a min.c and the header file for the project.
else
    DIRECTORY=$1
    PROJECT=$( echo "$2" | tr '[:upper:]'  '[:lower:]' )
    {
        # Create directories
        mkdir $DIRECTORY/srcs
        mkdir $DIRECTORY/includes
        mkdir $DIRECTORY/resources

        # Create main file
        touch > $DIRECTORY/srcs/main.c
        sh assets/generate_header.sh "$PROJECT.c" "$DIRECTORY/srcs/main.c" "c"
        echo "#include "\"$( echo "$PROJECT".h)"\"" >> $DIRECTORY/srcs/main.c
        echo "" >> $DIRECTORY/srcs/main.c
        echo "int		main(int argc, char *argv[])" >> $DIRECTORY/srcs/main.c
        echo "{" >> $DIRECTORY/srcs/main.c
        echo '	printf("Project %s successfully created! It works! 💩\\n", argv[0]);' >> $DIRECTORY/srcs/main.c
        echo "	return (argc);" >> $DIRECTORY/srcs/main.c
        echo "}" >> $DIRECTORY/srcs/main.c

        # Create header file
        touch > $DIRECTORY/includes/${PROJECT}.h
        sh assets/generate_header.sh "$PROJECT.h" "$DIRECTORY/includes/${PROJECT}.h" "c"
        echo "#ifndef $( echo "$PROJECT" | tr '[:lower:]'  '[:upper:]' )_H" \
        >> $DIRECTORY/includes/${PROJECT}.h
        echo "# define $( echo "$PROJECT" | tr '[:lower:]'  '[:upper:]' )_H" \
        >> $DIRECTORY/includes/${PROJECT}.h
        echo "">> $DIRECTORY/includes/${PROJECT}.h
        echo "# include <stdio.h>">> $DIRECTORY/includes/${PROJECT}.h
        echo "">> $DIRECTORY/includes/${PROJECT}.h
        echo "#endif ">> $DIRECTORY/includes/${PROJECT}.h

    } &> /dev/null
fi
    exit 0
