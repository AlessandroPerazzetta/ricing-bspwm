#!/usr/bin/env bash

# Install script for bspwm ricing

# Dirs
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"
CDIR="$HOME/.config"

# Install Fonts
install_fonts() {
	echo -e "\n[*] Installing fonts..."
	[[ ! -d "$FDIR" ]] && mkdir -p "$FDIR"
	cp -rf $DIR/fonts/* "$FDIR"
}

# Install Config Files
install_config_files() {
	if [[ -d "$CDIR" ]]; then
		echo -e "[*] Creating a backup of your polybar configs..."
		cp -R "$CDIR" "${CDIR}.old"
	fi

	echo -e "\n[*] Installing config files..."
	echo -e "\n\t alacritty, bspwm, mpd, nvim, polybar, rofi ..."
	[[ ! -d "$CDIR" ]] && mkdir -p "$CDIR"
	cp -rf $DIR/alacritty/* "$CDIR"
	cp -rf $DIR/bspwm/* "$CDIR"
	cp -rf $DIR/mpd/* "$CDIR"
	cp -rf $DIR/nvim/* "$CDIR"
	cp -rf $DIR/polybar/* "$CDIR"
	cp -rf $DIR/rofi/* "$CDIR"
}

# Main
main() {
	clear
	cat <<- EOF
		[*] Ricing bspwm...
		
	EOF

	install_fonts
	install_config_files
}

main
