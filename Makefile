# Folders and Names
NAME		= libftprintf.a
SRCSDIR		= srcs
OBJSDIR		= objs
INCLUDES	= incs

SRCS			=	ft_printf.c ft_printf_itoa_base_utils.c ft_printf_utils.c ft_printf_utils_2.c
OBJS		= $(SRCS:%.c=$(OBJSDIR)/%.o)
	
# Compiler options
CC			= gcc
CFLAGS		= -Wall -Wextra -g3

all: $(NAME)

$(NAME): $(OBJS)
	@echo "Bağlama \033[4;1;34m$@\033[0m"
	@ar rc $(NAME) $(OBJS)
	@echo "\033[4;1;32m\033[47mBaşarılı!\033[0m 😊"

$(OBJS): $(OBJSDIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo "derleniyor \033[1;31m$<\033[0m"
	@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

clean:
	rm -rf $(OBJSDIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re