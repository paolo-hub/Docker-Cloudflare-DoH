# Use Alpine Linux Image
FROM alpine

# Install dnscrypt-proxy e dnscrypt-proxy-openrc
RUN apk add --no-cache \
    bash \
    bind-tools \
    iptables \
    ip6tables \
    curl \
    openrc \
    dnscrypt-proxy \
    dnscrypt-proxy-openrc

# Copy configuration file
COPY dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml

# Expose port 5353 for DNS service
EXPOSE 5353/udp 5353/tcp

# Set the init command for dnscrypt-proxy
CMD ["dnscrypt-proxy", "-config", "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"]

