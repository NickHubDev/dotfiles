#!/bin/bash

# REPO_URL = https://github.com/NickHubDev/dotfiles.git
# If you need to understand something that is not cleared at all
# use the config / instalation guide for a best experience.

set -euo pipefail

# source /etc/os-release

# For the First Version of this Project, there's don't will be support specifity for
# any single distro. That's a future feature!

source "./colors.sh"

cat << EOF 
This configuration is about to delete the next .config dirs:

    1. $HOME/.config/hypr
    2. $HOME/.config/wofi
    3. $HOME/.config/neofetch
    4. $HOME/.config/nvim
    5. $HOME/.config/waybar
    6. $HOME/.config/btop

EOF

advice_msg=$(printf "If you have some config that you want to preserve, type ${GREEN}[y/n]${RESET}: ")

read -p "$advice_msg" res

declare -A recurses=(
    ["hypr"]="Hyprland"
    ["wofi"]="wofi"
    ["neofetch"]="neofetch"
    ["nvim"]="nvim"
    ["waybar"]="waybar"
    ["btop"]="btop"
)

save_config() {
    printf "${ACTION}=>${RESET} Starting a safe config instalation\n"
    mkdir -p "$HOME/.config/ConfigBackups"
    backups="$HOME/.config/ConfigBackups"

    for dir in "${!recurses[@]}"
    do
        package="${recurses[$dir]}"
        path="$HOME/.config/$dir"
        base="$HOME/.config/"

        if [[ -d $path ]]; then
            mv "$path" "$backups"
            mv "$dir" "$base"
        else
            mv "$dir" "$base"
        fi

        if command -v "$package" >/dev/null 2>&1; then
            
        else
            printf "${DATA}=>${RESET} $package is not installed, we are doing that..."
            sudo pacman -S "$package"
            printf "${FINE}=>${RESET} $package installed succesfuly!"
        fi
    done
}

origin_config() {
    printf "${ERROR}=>${RESET} Starting a normal config instalation ${DATA}[All config dirs that interfiere on rice will be rewrites]${RESET}\n"

    for dir in "${!recurses[@]}"
    do
        package="${recurses[$dir]}"
        path="$HOME/.config/$dir"
        base="$HOME/.config/"

        if [[ -d $path ]]; then
            rm -rf "$path"
            mv "$dir" "$base"
        else
            mv "$dir" "$base"
        fi

        if command -v "$package" >/dev/null 2>&1; then
            
        else
            printf "${DATA}=>${RESET} $package is not installed, we are doing that..."
            sudo pacman -S "$package"
            printf "${FINE}=>${RESET} $package installed succesfuly!"
        fi

    done
}


if [[ -z $res || $res == "y" ]]; then
    save_config
elif [[ $res == "n" ]]; then
    origin_config
else
    printf "${ERROR}Invalid Value Was Provided, Try Again...${RESET}"
    exit 1
fi




