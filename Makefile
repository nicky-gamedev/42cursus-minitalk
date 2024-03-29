SERVER = server

CLIENT = client

CC = clang

FLAGS = -Wall -Wextra -Werror

LIBFT = libft-printf

INCLUDES = includes

all: $(SERVER) $(CLIENT)

$(SERVER):
		@printf "Compiling $(RE)server...$(RC)\n"
		@$(CC) $(FLAGS) srcs/server.c -c -I $(INCLUDES)
		@make -C $(LIBFT) all -s
		@$(CC) $(FLAGS) server.o $(LIBFT)/libftprintf.a -o $(SERVER)

$(CLIENT):
		@printf "Compiling $(CY)client...$(RC)\n"
		@$(CC) $(FLAGS) srcs/client.c -c -I $(INCLUDES)
		@make -C $(LIBFT) all -s
		@$(CC) $(FLAGS) client.o $(LIBFT)/libftprintf.a -o $(CLIENT)

clean:
		@printf "$(YE)Cleaning .o...$(RC)\n"
		@make -C $(LIBFT) clean -s
		@rm -rf client.o server.o

fclean: clean
		@printf "$(YE)Cleaning executables and .a...$(RC)\n"
		@make -C $(LIBFT) fclean -s
		@rm -rf $(CLIENT) $(SERVER)

re: fclean all

#colors
GR	= \033[32;1m
RE	= \033[31;1m
YE	= \033[33;1m
CY	= \033[36;1m
RC	= \033[0m
