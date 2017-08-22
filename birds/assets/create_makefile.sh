#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_makefile.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 09:23:52 by jaleman           #+#    #+#              #
#    Updated: 2017/03/17 09:23:53 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 3 ] ; then
    echo 'usage: sh $0 directory_path project_name libft_flag'

# Makefile without libft
elif [ "$3" -ne 1 ] ; then
    DIRECTORY=$1
    PROJECT=$2
    {
        touch > $DIRECTORY/Makefile
        sh assets/generate_header.sh "Makefile" "$DIRECTORY/Makefile" "script"
        echo "NAME = $( echo "$PROJECT" )" >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'FLAGS = -Wall -Wextra -Werror -g' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC_DIR = ./srcs/' >> $DIRECTORY/Makefile
        echo 'OBJ_DIR = ./objs/' >> $DIRECTORY/Makefile
        echo 'INC_DIR = ./includes/' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC_FILES = main.c' >> $DIRECTORY/Makefile
        echo 'OBJ_FILES = $(SRC_FILES:.c=.o)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))' >> $DIRECTORY/Makefile
        echo 'OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'all: obj $(NAME)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'obj:' >> $DIRECTORY/Makefile
        echo '	@mkdir -p $(OBJ_DIR)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '$(OBJ_DIR)%.o:$(SRC_DIR)%.c' >> $DIRECTORY/Makefile
        echo '	@gcc $(FLAGS) -I $(INC_DIR) -o $@ -c $<' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '$(NAME): $(OBJ)' >> $DIRECTORY/Makefile
        echo '	@echo "(ﾉ◕ヮ◕)ﾉ*:・ﾟ✧ Compiling... Wait a sec."' >> $DIRECTORY/Makefile
        echo '	@gcc $(OBJ) -o $(NAME)' >> $DIRECTORY/Makefile
        echo '	@echo "(•̀ᴗ•́)و $(NAME) generated!".' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'clean:' >> $DIRECTORY/Makefile
        echo '	@rm -Rf $(OBJ_DIR)' >> $DIRECTORY/Makefile
        echo '	@echo "¯\_(ツ)_/¯ Objects removed!"' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'fclean: clean' >> $DIRECTORY/Makefile
        echo '	@rm -f $(NAME)' >> $DIRECTORY/Makefile
        echo '	@echo "(╯°□°）╯︵ ┻━┻ $(NAME) removed!"' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 're: fclean all' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '.PHONY: all clean fclean re' >> $DIRECTORY/Makefile

    } &> /dev/null

# Makefile WITH libft
else
    DIRECTORY=$1
    PROJECT=$2
    {
        touch > $DIRECTORY/Makefile
        sh assets/generate_header.sh "Makefile" "$DIRECTORY/Makefile" "script"
        echo "NAME = $( echo "$PROJECT" )" >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'FLAGS = -Wall -Wextra -Werror -g' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC_DIR = ./srcs/' >> $DIRECTORY/Makefile
        echo 'OBJ_DIR = ./objs/' >> $DIRECTORY/Makefile
        echo 'INC_DIR = ./includes/' >> $DIRECTORY/Makefile
        echo 'LIBFT_DIR = ./libft/' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC_FILES = main.c' >> $DIRECTORY/Makefile
        echo 'OBJ_FILES = $(SRC_FILES:.c=.o)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))' >> $DIRECTORY/Makefile
        echo 'OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))' >> $DIRECTORY/Makefile
        echo 'LIBFT = $(addprefix $(LIBFT_DIR), libft.a)' >> $DIRECTORY/Makefile
        echo 'LNK  = -L $(LIBFT_DIR)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'all: obj $(LIBFT) $(NAME)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'obj:' >> $DIRECTORY/Makefile
        echo '	@mkdir -p $(OBJ_DIR)' >> $DIRECTORY/Makefile
        echo '$(OBJ_DIR)%.o:$(SRC_DIR)%.c' >> $DIRECTORY/Makefile
        echo '	@gcc $(FLAGS) -I $(LIBFT_DIR) -I $(INC_DIR) -o $@ -c $<' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '$(LIBFT):' >> $DIRECTORY/Makefile
        echo '	@make -C $(LIBFT_DIR)' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '$(NAME): $(OBJ)' >> $DIRECTORY/Makefile
        echo '	@echo "(ﾉ◕ヮ◕)ﾉ*:・ﾟ✧ Compiling... Wait a sec."'>> $DIRECTORY/Makefile
        echo '	@gcc $(OBJ) $(LNK) -lm -o $(NAME)' >> $DIRECTORY/Makefile
        echo '	@echo "(•̀ᴗ•́)و $(NAME) generated!".' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'clean:' >> $DIRECTORY/Makefile
        echo '	@rm -Rf $(OBJ_DIR)' >> $DIRECTORY/Makefile
        echo '	@make -C $(LIBFT_DIR) clean' >> $DIRECTORY/Makefile
        echo '	@echo "¯\_(ツ)_/¯ Objects removed!"' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 'fclean: clean' >> $DIRECTORY/Makefile
        echo '	@rm -f $(NAME)' >> $DIRECTORY/Makefile
        echo '	@make -C $(LIBFT_DIR) fclean' >> $DIRECTORY/Makefile
        echo '	@echo "(╯°□°）╯︵ ┻━┻ $(NAME) removed!"' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo 're: fclean all' >> $DIRECTORY/Makefile
        echo '' >> $DIRECTORY/Makefile
        echo '.PHONY: all clean fclean re' >> $DIRECTORY/Makefile

    } &> /dev/null
fi
    exit 0
