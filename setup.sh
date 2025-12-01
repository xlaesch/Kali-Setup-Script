#!/bin/bash

# 1. Update the System
echo "[+] Updating System..."
sudo apt update && sudo apt full-upgrade -y

# 2. Disable Sleep and Auto-Logout
echo "[+] Disabling Sleep and Auto-Logout..."
# Disable automatic suspend (AC power)
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
# Disable automatic suspend (battery power)
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
# Disable screen blank
gsettings set org.gnome.desktop.session idle-delay 0
# Disable automatic screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
# Disable power button suspend
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'

# 3. Install "Quality of Life" Tools
# Terminator: Better terminal management
# Tmux: Terminal multiplexer
# Zsh/Oh-My-Zsh: Better shell experience
echo "[+] Installing Essentials..."
sudo apt install -y tmux neovim git curl wget jq python3-pip

# 4. Install Industry Standard Network Tools (Active Directory/Infrastructure)
echo "[+] Installing Network Tools..."
sudo apt install -y feroxbuster seclists bloodhound neo4j

# 5. Install Python Tools via Pip (pipx is recommended on newer Kali)
echo "[+] Installing Python Tools..."
sudo apt install -y pipx
pipx ensurepath
pipx install crackmapexec
pipx install impacket 

# 6. Clone GitHub Repositories (Tools not in apt)
# Create a /opt/tools directory for manual installs
echo "[+] Cloning GitHub Repos to /opt/tools..."
sudo mkdir -p /opt/tools
sudo chown $USER:$USER /opt/tools
cd /opt/tools

git clone https://github.com/carlospolop/PEASS-ng.git

git clone https://github.com/flozz/p0wny-shell.git

echo "[+] Installing Burpsuite Professional..."
wget -qO- https://raw.githubusercontent.com/xiv3r/Burpsuite-Professional/main/install.sh | sudo bash

# 7. Setup Wordlists (Extract Rockyou)
echo "[+] Unzipping Rockyou..."
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz


echo "[+] Setup Complete! Please reboot."