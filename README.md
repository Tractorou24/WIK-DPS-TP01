# **WIK-DPS-TP01**

WIK-DPS-TP01 is a simple rust web server using the rocket library to serve the request headers in json when you make a <span style="color:orange">/GET</span> request on <span style="color:orange">/ping</span>.

It returns 404 for any other request.

The server port is configurable with the <span style="color:orange">PING_LISTEN_PORT</span> environnement variable set to a valid port.
Else, it will be set to <span style="color:orange">8080</span> by default.

## How to build ?

<ins>Prerequisites :</ins>
- A working rust compiler and linker using the cargo package manager
- An internet connection for cloning the repo and downloading the dependencies

<ins>Build :</ins>
- Clone the repository
- Open a terminal in the <span style="color:orange">basic_server</span> folder
- Run the <span style="color:orange">cargo run</span> command
