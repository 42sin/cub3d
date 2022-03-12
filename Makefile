# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eozben <eozben@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/21 21:06:22 by eozben            #+#    #+#              #
#    Updated: 2022/03/12 21:17:52 by eozben           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cub3D
FLAGS = -Wall -Wextra -Werror
INC = cub3d.h
SRCS = main.c 
OBJ_PATH = ./objs/
OBJS = $(patsubst %.c,$(OBJ_PATH)%.o,$(SRCS))
LIBS = -Llibft -lft -Lmlx -lmlx
LIBFT = ./libft/libft.a
LIBMLX = ./mlx/libmlx.a

all:$(NAME)

$(NAME): $(OBJ_PATH) $(OBJS) $(LIBFT) $(LIBMLX)
	@$(CC) $(FLAGS) $(OBJS) -o $(NAME) $(LIBS) -framework OpenGL -framework AppKit
	@echo "                                                         "
	@echo " \033[1;32m  ___|   _ \    \  |   _ \ _ _|  |      ____|  __ \   | "
	@echo "  |      |   |  |\/ |  |   |  |   |      __|    |   |  | "
	@echo "  |      |   |  |   |  ___/   |   |      |      |   | _| "
	@echo " \____| \___/  _|  _| _|    ___| _____| _____| ____/  _) \033[0m"
	@echo "                                                         "

$(OBJ_PATH)%.o: %.c $(INC)
	@$(CC) $(FLAGS) -c $< -o $@

$(LIBMLX):
	@echo ""
	@echo "mlx:"
	@echo "\033[1;32m0%\033[0m   [                      ]"
	@echo "\033[1;32m33%\033[0m  [\033[1;32m ██████\033[0m               ]"
	@make -sC ./mlx
	@echo "\033[1;32m50%\033[0m  [\033[1;32m ██████████\033[0m           ]"
	@echo "\033[1;32m83%\033[0m  [\033[1;32m ████████████████\033[0m     ]"
	@echo "\033[1;32m100%\033[0m [\033[1;32m ████████████████████ \033[0m]"

$(LIBFT):
	@echo ""
	@echo "libft:"
	@echo "\033[1;32m0%\033[0m   [                      ]"
	@echo "\033[1;32m33%\033[0m  [\033[1;32m ██████\033[0m               ]"
	@echo "\033[1;32m50%\033[0m  [\033[1;32m ██████████\033[0m           ]"
	@make -sC ./libft
	@echo "\033[1;32m83%\033[0m  [\033[1;32m ████████████████\033[0m     ]"
	@echo "\033[1;32m100%\033[0m [\033[1;32m ████████████████████ \033[0m]"

$(OBJ_PATH):
	@mkdir -p $(OBJ_PATH)

clean:
	@rm -rf $(OBJ_PATH)
	@make clean -C ./libft
	@echo "\033[1;32m.o files removed!\033[0m"

fclean:
	@rm -rf $(NAME)
	@rm -rf $(OBJ_PATH)
	@make clean -C ./mlx
	@make fclean -C ./libft
	@echo "\033[1;32mbinary files removed!\033[0m"

re: fclean all