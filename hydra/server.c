/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/16 23:08:20 by jaleman           #+#    #+#             */
/*   Updated: 2017/02/16 23:08:20 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "server.h"

/*
** Create a new socket.
*/

static int	create_socket(void)
{
	int		sock;

	if ((sock = socket(PF_INET, SOCK_STREAM, 0)) == -1)
		ft_puterror_fd("Couldn't create socket! :(", STDOUT);
	ft_putendl_fd("Socket created! :D", STDOUT);
	return (sock);
}

/*
** Bind the socket, assigning and address and port number to it.
*/

static void	bind_socket(int sock, int addr, int port)
{
	g_server.sin_family = PF_INET;
	g_server.sin_addr.s_addr = addr;
	g_server.sin_port = htons(port);
	if (bind(sock, (struct sockaddr *)&g_server, sizeof(g_server)) < 0)
		ft_puterror_fd("Binding failed! :(", STDOUT);
	ft_putendl_fd("Binding successful! :D", STDOUT);
}

/*
** Accept connection between client and server.
*/

static int	accept_connection(int server_socket)
{
	int		len;
	int		client_socket;

	len = sizeof(struct sockaddr_in);
	if ((client_socket = accept(server_socket, (struct sockaddr *)&g_client, \
			(socklen_t*)&len)) < 0)
		ft_puterror_fd("Failed to accept! Try again... >:(", STDOUT);
	ft_putendl_fd("Conecction accepted! :D", STDOUT);
	return (client_socket);
}

/*
** Receive input from the client. If the message is equal to "ping", the server
** will print to the client's file descriptor "pong pong".
*/

static void	receive_message(int client_socket)
{
	int		read_size;
	char	client_message[BUFF_SIZE];

	while ((read_size = recv(client_socket, client_message, BUFF_SIZE, 0)) > 0)
	{
		if (!(ft_strncmp(client_message, "ping", 4)) \
				&& (client_message[5] == '\n' || client_message[5] == '\0'))
			ft_putendl_fd("pong pong", client_socket);
		ft_bzero(client_message, BUFF_SIZE);
	}
	if (!(read_size))
		ft_putendl_fd("Client disconnected. Server will stop for now.", STDOUT);
	else if (read_size == -1)
		ft_puterror_fd("Receive message from socket failed! :(", STDOUT);
}

/*
** Runs the server.
*/

int			main(void)
{
	int		server_socket;
	int		client_socket;

	server_socket = create_socket();
	bind_socket(server_socket, INADDR_ANY, PORT_NBR);
	listen(server_socket, BACKLOG);
	ft_putendl_fd("Waiting for connections...", STDOUT);
	client_socket = accept_connection(server_socket);
	receive_message(client_socket);
	return (0);
}
