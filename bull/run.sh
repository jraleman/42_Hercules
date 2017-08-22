#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_project.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/31 15:13:49 by jaleman           #+#    #+#              #
#    Updated: 2017/03/31 15:14:03 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# List of champions! :D
HERO="yamcha"
ENEMY="zork"

# Champions directory.
CHMP_DIR="champions"

# Compiles the assembly to corewar binary :O
rm -f $CHMP_DIR/$HERO.cor $CHMP_DIR/$ENEMY.cor
./asm $CHMP_DIR/$HERO.s && ./asm $CHMP_DIR/$ENEMY.s

# Run in visual mode (passing "gui" as an argument).
if [[ ("$1" == "gui") ]] ; then
	./corewar -n $CHMP_DIR/$HERO.cor $CHMP_DIR/$ENEMY.cor
	exit 0
fi

# Runs normally if the argument for visual mode isn't valid.
./corewar $CHMP_DIR/$HERO.cor $CHMP_DIR/$ENEMY.cor
