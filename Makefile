NAME = ircserv
BONUS = bot
CPPFLAGS = -Wall -Wextra -Werror
INCLUDES = -I lib/
SRCS = srcs/irc.cpp srcs/commands.cpp srcs/irc_parsing_and_init.cpp srcs/Clients.cpp srcs/Channels.cpp srcs/commands_channel.cpp
OBJS = $(SRCS:.cpp=.o)
BSRCS = bonus/warningbot.cpp
BOBJS = $(BSRCS:.cpp=.o)

all: $(NAME)

$(NAME): $(OBJS)
	c++ $(CPPFLAGS) $(OBJS) -o $(NAME)

%.o: %.cpp
	c++ $(CPPFLAGS) $(INCLUDES) -c $< -o $@

bonus: $(BONUS)

$(BONUS): $(BOBJS)
	c++ $(CPPFLAGS) $(BOBJS) -o $(BONUS)

%.o: %.cpp
	c++ $(CPPFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(BOBJS)

fclean: clean
	rm -f $(NAME)
	rm -f $(BONUS)

re: fclean all

.PHONY: all bonus clean fclean re
