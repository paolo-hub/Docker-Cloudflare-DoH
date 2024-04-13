# Docker-Cloudflare-DoH
This is a Docker image for a ready-to-use DNS-over-HTTPS server with Cloudflare.

![alt text](https://badgen.net/badge/release/v.1.0/green?) ![alt text](https://badgen.net/badge/code/Docker/blue?)

# What is this?
This is a ready-to-use Docker image for creating a DNS server as a container. It connects directly to Cloudflare's DoH service and requires no further configuration. It can be used as a DNS server for the home network set on various devices, as a default server for the local network, or upstream for any type of service, such as other containers or for pi-Hole.

# How to Use It

To run the container, you can execute it as follows:

docker run -d \
  --name cloudflare-doh \
  -p 53:5353/udp \
  --restart unless-stopped \
  paolo83/cloudflare-doh:latest

You can also use the following Docker Compose file:

version: "3.9"
services:
  doh:
    container_name: cloudflare-doh
    image: paolo83/cloudflare-doh:latest
    ports:
      - target: 5353
        published: 53
        protocol: udp
        mode: host
    restart: unless-stopped

The image exposes port 5353, which can be routed to the preferred host port. In the proposed configuration, it's set to the default port for DNS servers, port 53.

# Connection Test

Once the container is active, you can set it up as a DNS server.
To verify the correct configuration, you can visit Cloudflare's test site: https://one.one.one.one/help/
