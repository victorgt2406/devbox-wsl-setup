#!/bin/bash
# IMPORTANT systemd must be supported, check readme file to fix it

NIX_CONF="/etc/nix/nix.conf"
BASHRC="$HOME/.bashrc"

# Instalación de Nix
echo "Instalando Nix..."
sh <(curl -L https://nixos.org/nix/install) --daemon

# Esperar que termine la instalación de Nix
echo "Esperando que se complete la instalación de Nix..."
sleep 10

# Configuración de Nix
echo "Configurando Nix..."
sudo bash -c "echo 'experimental-features = nix-command flakes' >> $NIX_CONF"

# Instalación de Devbox
echo "Instalando Devbox..."
curl -fsSL https://get.jetify.com/devbox | bash

# Verificar si direnv está instalado
if ! command -v direnv &> /dev/null
then
    echo "Instalando direnv..."
    sudo apt update
    sudo apt install -y direnv
else
    echo "direnv ya está instalado."
fi

# Configurar direnv en ~/.bashrc
echo "Configurando direnv en ~/.bashrc..."
if ! grep -q 'eval "$(direnv hook bash)"' "$BASHRC"; then
    echo 'eval "$(direnv hook bash)"' >> "$BASHRC"
fi

# Aplicar los cambios en el bashrc
echo "Aplicando los cambios en ~/.bashrc..."
source "$BASHRC"

# Permitir el uso de direnv
echo "Ejecutando 'direnv allow'..."
direnv allow

echo "Configuración completada. El entorno WSL2 con Nix, Devbox y direnv está listo."