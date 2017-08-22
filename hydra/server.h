/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/17 03:12:13 by jaleman           #+#    #+#             */
/*   Updated: 2017/02/17 03:12:16 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SERVER_H
# define SERVER_H

/*
** @unistd     : write(2)
** @stdlib     : size_t, sizeof, exit(3)
** @sys/socket : PF_INETM, STOCK_STREAM, bind(2), recv(2), listen(2)
** @arpa/inet  : sockaddr_in, htons(3)
*/

# include <unistd.h>
# include <stdlib.h>
# include <sys/socket.h>
# include <arpa/inet.h>

/*
** Macros for standard output, buffer size, port number, and timeout.
*/

# define STDOUT		(1)
# define BUFF_SIZE	(4096)
# define PORT_NBR	(6969)
# define BACKLOG	(3)

/*
** Global variables to manage the server and client session.
*/

struct sockaddr_in	g_server;
struct sockaddr_in	g_client;

/*
** Prototypes for the auxiliary functions (libft).
*/

int					ft_strncmp(const char *s1, const char *s2, size_t n);
void				ft_bzero(void *s, size_t n);
void				ft_putendl_fd(const char *s, int fd);
void				ft_puterror_fd(const char *msg, int fd);

#endif
