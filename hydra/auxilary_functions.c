/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   auxilary_functions.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/17 20:24:12 by jaleman           #+#    #+#             */
/*   Updated: 2017/02/17 20:24:12 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "server.h"

/*
** Outputs the string s to the file descriptor fd followed by a ’\n’.
*/

void	ft_putendl_fd(const char *s, int fd)
{
	int		i;

	i = 0;
	while (s[i])
		write(fd, &s[i++], 1);
	write(fd, "\n", 1);
}

/*
** Prints an error message, and exit the program with a return value of one (1).
*/

void	ft_puterror_fd(const char *msg, int fd)
{
	ft_putendl_fd(msg, fd);
	exit(1);
}

/*
** Overwrites the bytes of a string (*s) to zeroes bytes, depending on the
** value of the variable n. If the variable n is zero (0), then nothing
** will happen.
*/

void	ft_bzero(void *s, size_t n)
{
	size_t		i;

	i = 0;
	while (n--)
		((unsigned char *)s)[i++] = 0;
}

/*
** Lexicographically compares not more than n characters of the
** null-terminated strings s1 and s2.  characters that appear after a `\0'
** character are not compared.
*/

int		ft_strncmp(const char *s1, const char *s2, size_t n)
{
	unsigned char	*us1;
	unsigned char	*us2;

	if (!n)
		return (0);
	us1 = (unsigned char *)s1;
	us2 = (unsigned char *)s2;
	while ((*us1 && (*us1 == *us2)) && --n)
	{
		if (*us1 != *us2)
			return (*us1 - *us2);
		us1 += 1;
		us2 += 1;
	}
	return (*us1 - *us2);
}
