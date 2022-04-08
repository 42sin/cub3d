/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbindere <fbindere@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/15 22:41:17 by eozben            #+#    #+#             */
/*   Updated: 2022/04/08 22:01:55 by fbindere         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

int	ft_is_whitespace(char c)
{
	if (c == ' ' || c == '\t' || c == '\r')
		return (1);
	else
		return (0);
}

int	ft_is_empty_line(char *s)
{
	int	i;

	i = 0;
	while (ft_is_whitespace(s[i]))
		i++;
	if (s[i] == '\n')
		return (1);
	return (0);
}

int	skip_whitespaces(char *str)
{
	int	i;

	i = 0;
	while (ft_is_whitespace(str[i]))
		i++;
	return (i);
}

void    free_map(t_map *map)
{
	int i;
	if (map->fd)
		close(map->fd);
	i = 0;
	while (i < 4)
		free(map->paths[i++]);
	//brauchen hier win.mlx pointer also cub.
	// while (i < 4)
	// 	mlx_destroy_image(map->texture->img)
	i = 0;
	while (map->map && map->map[i])
		free(map->map[i++]);
	free(map->map);
}

void	map_error(t_map *map, char *str, char *error_msg)
{
	if (map)
		free_map(map);
	if (str)
		free(str);
	printf("Error\n%s\n", error_msg);
	exit(EXIT_FAILURE);
}
