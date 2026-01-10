#!/data/data/com.termux/files/usr/bin/bash
set -e

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RESET='\033[0m'

DEPS=(git tte fish eza bat)

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
git clone https://github.com/termuxvoid/MorphShell "$DIR"

ASSETS="$DIR/assets"

if [ "$(basename "$SHELL")" != "fish" ]; then
  echo -e "${GREEN}[*] Switching shell to fish${RESET}"
  chsh -s fish
fi

read -rp "Enter prompt name [MorfShell]: " NAME
NAME="${NAME:-MorfShell}"

mkdir -p ~/.config/fish ~/.config ~/.termux

cp "$ASSETS/config.fish" ~/.config/fish/config.fish
cp "$ASSETS/font.ttf" "$ASSETS/colors.properties" ~/.termux

sed "s/MorfShell/$NAME/g" "$ASSETS/starship.config" > ~/.config/starship.toml
sed "s/MorfShell/$NAME/g" "$ASSETS/motd" > ~/.config/morfshell


echo -e "${GREEN}[✓] MorphShell installed. Restart Termux.${RESET}"
