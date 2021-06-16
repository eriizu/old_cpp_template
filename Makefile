
CC		=	gcc

RM		=	rm -fv

NAME		=	uniq

SRCS		=	src/strcat.c\
			src/strlen.c\
			src/strdupcat.c\
			src/findchar.c\
			src/strcmp.c\
			src/readall.c\
			src/uniq.c\

SRC_MAIN	=	src/main.c

OBJS		=	$(SRCS:.c=.o)

OBJ_MAIN	=	$(SRC_MAIN:.c=.o)

TEST		=	unit_tests.out

SRCS_TEST	=	$(wildcard test/*.c)

OBJS_TEST	=	$(SRCS_TEST:.c=.o)

CFLAGS		+=	-W -Wall -Wextra

CFLAGS		+=	-I include/

# LDFLAGS	=	-lm -lcsfml-window -lcsfml-system -lcsfml-graphics
LDFLAGS		=

%.o: %.c
	@printf "[\033[0;36mcompiling\033[0m]% 39s\r" $< | tr " " "."
	@$(CC) -c -o $@ $< $(CFLAGS)
	@printf "[\033[0;32mcompiled\033[0m]% 40s\n" $< | tr " " "."

all: $(NAME)

tests: $(TEST)

$(NAME): $(OBJ_MAIN) $(OBJS)
# @printf "[\033[0;36marchiving\033[0m]% 39s\r" $(NAME) | tr " " "."
	@printf "[\033[0;36mlinking\033[0m]% 41s\r" $(NAME) | tr " " "."
	@$(CC) $(OBJ_MAIN) $(OBJS) $(LDFLAGS) -o $(NAME)
	@printf "[\033[0;36mlinked\033[0m]% 42s\n" $(NAME) | tr " " "."

$(TEST): $(OBJS) $(OBJS_TEST)
	@printf "[\033[0;36mlinking\033[0m]% 41s\r" $(TEST) | tr " " "."
	@$(CC) $(OBJS_TEST) $(OBJS) -o $(TEST) -lcriterion
	@printf "[\033[0;36mlinked\033[0m]% 42s\n" $(TEST) | tr " " "."

clean:
	@printf "[\033[0;31mdeletion\033[0m][objects]% 31s\n" `$(RM) $(OBJS) $(OBJ_MAIN) $(OBJS_TEST) | wc -l | tr -d '\n'` | tr " " "."

fclean: clean
	@printf "[\033[0;31mdeletion\033[0m][products]% 30s\n" `$(RM) $(NAME) $(TEST) | wc -l | tr -d '\n'` | tr " " "."

re: fclean all

.PHONY: all clean fclean re
