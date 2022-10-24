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
<br><br>

# **WIK-DPS-TP02**
WIK-DPS-TP02 is the TP for the doker image used to build and run the WIK-DPS-TP01 server.

<ins>Build and run the server :</ins>
- Open a terminal in the <span style="color:orange">basic_server</span> folder
- Run the <span style="color:orange">docker build -t basic_server .</span> command to build the image
- Run the <span style="color:orange">docker run -p 8080:8080 basic_server</span> command to run the server

The vulnerabilities in the docker image can be found in the <span style="color:orange">scan_report.json</span> file.

<ins>Bonus :</ins>

The goal was to make a counter fron 0 to 10000 running in docker with an image size less than 500 bytes.

The current image is only 138 bytes.

*Build and run on local machine :*
- Make sure you have nasm installed and a linux machine
- Open a terminal in the <span style="color:orange">count_asm</span> folder
- Run the <span style="color:orange">nasm -f bin -o a.out count.asm</span> command to build the binary
- Run the <span style="color:orange">./a.out</span> command to run the binary

*Build and run on docker :*
- Open a terminal in the <span style="color:orange">count_asm</span> folder
- Run the <span style="color:orange">docker build -t count_asm .</span> command to build the image
- Run the <span style="color:orange">docker run count_asm</span> command to run the image
