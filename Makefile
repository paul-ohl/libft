SRCS		= $(subst ./src/,,$(wildcard ./src/*.c))

OBJ_DIR		= obj
SRC_DIR		= src
INC_DIR		= .

OBJS		:= $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRCS))

NAME		= libft.a
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

all:			$(NAME)

$(NAME):		$(OBJS)
	ar rc $(NAME) $(OBJS)

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@ -I $(INC_DIR)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY:	all clean clean re
