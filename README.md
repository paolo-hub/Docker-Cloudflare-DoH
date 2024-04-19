# Docker-Cloudflare-DoH
This is a Docker image for a ready-to-use DNS-over-HTTPS server with Cloudflare.

![alt text](https://badgen.net/badge/release/v.1.1/green?) ![alt text](https://badgen.net/badge/platform/Docker/blue?)


# What is this?
This Docker image is pre-configured for setting up a DNS server within a container. It seamlessly links to Cloudflare's DoH service, eliminating the need for additional setup. It's versatile, serving as a DNS server for home networks across different devices, acting as the default server for local networks, or serving upstream for various services like other containers or pi-Hole.

# How to Use It

## Supported Platforms

The image is available on [Docker Hub page](https://hub.docker.com/repository/docker/paolo83/cloudflare-doh)

The supported platforms are:
  * linux/amd64
  * linux/arm/v7
  * linux/arm64

## OPTIONAL: Build Your Own Image

If you prefer, you can build the image locally.

Clone the Git repository to your local machine:

```bash
git clone https://github.com/paolo-hub/Docker-Cloudflare-DoH.git
```
Navigate into the cloned repository directory:
```
cd Docker-Cloudflare-DoH
```
Then, build the Docker image using the provided Dockerfile:
```
docker build -t paolo83/cloudflare-doh:latest -f Dockerfile .
```


## Creating and running a container

To launch the container, simply execute the following command:
```
docker run -d \
  --name cloudflare-doh \
  -p 53:53/udp \
  --restart unless-stopped \
  paolo83/cloudflare-doh:latest
```

You can alternatively utilize the following Docker Compose file:
```yaml
version: "3.9"
services:
  doh:
    container_name: cloudflare-doh
    image: paolo83/cloudflare-doh:latest
    ports:
      - target: 53
        published: 53
        protocol: udp
        mode: host
    restart: unless-stopped
```

The image exposes port 53, which can be mapped to the desired host port. In the suggested configuration, it's configured to the standard port for DNS servers, port 53.

# Connection Test

After the container is up and running, you can configure it as a DNS server. To confirm proper configuration, you can visit ![Cloudflare's test site](https://one.one.one.one/help/)

![alt text](https://github.com/paolo-hub/Docker-Cloudflare-DoH/blob/main/1111_test.jpg?raw=true)
