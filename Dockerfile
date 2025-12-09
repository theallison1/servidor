FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    iptables \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Instalar Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
