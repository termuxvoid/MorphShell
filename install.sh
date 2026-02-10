#!/data/data/com.termux/files/usr/bin/bash
set -e

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RESET='\033[0m'

clear
echo -e "${CYAN}
   __  ___              __   ______       ____
  /  |/  /__  _______  / /  / __/ /  ___ / / /
 / /|_/ / _ \/ __/ _ \/ _ \_\ \/ _ \/ -_) / / 
/_/  /_/\___/_/ / .__/_//_/___/_//_/\__/_/_/  
               /_/                            
${RESET}"

echo -e "${GREEN}
A sleek Termux theme with a smart prompt,
syntax highlighting, and a dynamic animated
banner that changes every session.
${RESET}"

rm -rf $PREFIX/etc/motd
DEPS=(git tte fish eza bat starship)

echo -e "${CYAN}[*] Checking dependencies...${RESET}"
for p in "${DEPS[@]}"; do
  if ! command -v "$p" >/dev/null 2>&1; then
    echo -e "${GREEN}[+] Installing $p${RESET}"
    apt install -y "$p"
  fi
done

TMPDIR="${TMPDIR:-/tmp}"
DIR="$TMPDIR/MorphShell"
rm -rf "$DIR"

echo -e "${CYAN}[*] Cloning MorphShell...${RESET}"
git clone -q https://github.com/termuxvoid/MorphShell "$DIR"

ASSETS="$DIR/assets"

if [ "$(basename "$SHELL")" != "fish" ]; then
  echo -e "${GREEN}[*] Switching shell to fish${RESET}"
  chsh -s fish
fi

read -rp "Enter prompt name [MorphShell]: " NAME
NAME="${NAME:-MorphShell}"

mkdir -p ~/.config/fish ~/.config ~/.termux

cp "$ASSETS/config.fish" ~/.config/fish/config.fish
cp "$ASSETS/font.ttf" "$ASSETS/colors.properties" ~/.termux

sed "s/user-name/$NAME/g" "$ASSETS/starship.toml" > ~/.config/starship.toml
sed "s/user-name/$NAME/g" "$ASSETS/motd" > ~/.config/morphshell

echo -e "${GREEN}[✓] MorphShell installed. Restart Termux.${RESET}"

