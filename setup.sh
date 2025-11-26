#!/bin/bash

# 1. Update the System
echo "[+] Updating System..."
sudo apt update && sudo apt full-upgrade -y

# 2. Install "Quality of Life" Tools
# Terminator: Better terminal management
# Tmux: Terminal multiplexer
# Zsh/Oh-My-Zsh: Better shell experience
echo "[+] Installing Essentials..."
sudo apt install -y terminator tmux neovim git curl wget jq python3-pip

# 3. Install Industry Standard Network Tools (Active Directory/Infrastructure)
echo "[+] Installing Network Tools..."
sudo apt install -y feroxbuster seclists bloodhound neo4j

# 4. Install Python Tools via Pip (pipx is recommended on newer Kali)
echo "[+] Installing Python Tools..."
sudo apt install -y pipx
pipx ensurepath
pipx install crackmapexec
pipx install impacket 
pipx install certipy-ad

# 5. Clone GitHub Repositories (Tools not in apt)
# Create a /opt/tools directory for manual installs
echo "[+] Cloning GitHub Repos to /opt/tools..."
sudo mkdir -p /opt/tools
sudo chown $USER:$USER /opt/tools
cd /opt/tools

git clone https://github.com/lgandx/Responder.git

git clone https://github.com/carlospolop/PEASS-ng.git

# 6. Setup Wordlists (Extract Rockyou)
echo "[+] Unzipping Rockyou..."
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

echo "[+] Setup Complete! Please reboot."