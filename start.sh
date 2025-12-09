#!/bin/bash

# Iniciar Tailscale
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
until tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=render-exit-node --advertise-exit-node; do
    sleep 0.1
done

# Mantener contenedor activo
tail -f /dev/null
