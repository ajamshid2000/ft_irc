This project has been created as part of the 42 curriculum.

## Project Description

In this project, we have made an IRC server that can be used with any standard IRC client (e.g., irssi). The server supports private messages and channels, with operators and regular users on channels, and includes a bonus bot.

The server supports file transfers and implements the following commands specific to channel operators:

- **KICK** - Eject a client from the channel
- **INVITE** - Invite a client to a channel
- **TOPIC** - Change or view the channel topic
- **MODE** - Change the channel's mode:
  - `i`: Set/remove Invite-only channel
  - `t`: Set/remove the restrictions of the TOPIC command to channel operators
  - `k`: Set/remove the channel key (password)
  - `o`: Give/take channel operator privilege
  - `l`: Set/remove the user limit to channel

## Project Structure

The codebase is organized into the following directories for better maintainability:

- **lib/**: Contains header files (.hpp) for classes and structures.
  - `Channels.hpp`: Header for channel management.
  - `Clients.hpp`: Header for client management.

- **srcs/**: Contains the main source files (.cpp) implementing the IRC server functionality.
  - `irc.cpp`: Main IRC server logic.
  - `commands.cpp`: Implementation of IRC commands.
  - `irc_parsing_and_init.cpp`: Parsing and initialization functions.
  - `Clients.cpp`: Client management implementation.
  - `Channels.cpp`: Channel management implementation.
  - `commands_channel.cpp`: Channel-specific command implementations.

- **bonus/**: Contains bonus features.
  - `warningbot.cpp`: Implementation of the warning bot.

- **Makefile**: Build configuration for compiling the project.
- **README.md**: This file, providing project documentation.

## Building and Running

Use `make` to generate the executable, then follow the instructions by running the executable to start the server. After running the server, you can connect to it using any standard IRC client, such as irssi.

## Connecting with Irssi

Irssi is a popular command-line IRC client. To use it with your IRC server:

### Installation

If irssi is not installed, install it using your package manager:

```bash
# On Ubuntu/Debian
sudo apt install irssi

# On macOS (with Homebrew)
brew install irssi

# On other systems, check your package manager
```

### Connecting to the Server

1. **Start the IRC Server**: First, ensure your IRC server is running (e.g., `./ircserv <port> <password>`).

2. **Launch Irssi**: Open a terminal and start irssi:

   ```bash
   irssi
   ```

3. **Connect to the Server**: In irssi, connect to your local server. Replace `<port>` with the port your server is running on (default is often 6667), and `<password>` with the server password if required:

   ```
   /connect localhost <port> <password>
   ```

   For example:
   ```
   /connect localhost 6667 mypassword
   ```

4. **Set Your Nickname**: If not prompted, set your nickname:

   ```
   /nick yournickname
   ```

5. **Join a Channel**: Join a channel (channels start with #):

   ```
   /join #mychannel
   ```

### Basic Irssi Commands

- **Send Messages**: Type your message and press Enter in the channel window.
- **Private Messages**: `/msg nickname message`
- **List Channels**: `/list`
- **Quit**: `/quit`

### File Transfers (DCC)

The server supports file transfers via DCC. In irssi:

- **Receive a File**: `/dcc get sender_nick`
- **Send a File**: `/dcc send receiver_nick /path/to/file`
- **Check DCC Settings**: `/set dcc_download_path` or `/set dcc_autoget`

For more irssi commands, type `/help` in irssi or refer to the irssi documentation.
