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
	cp -rf $DIR/.config/alacritty/ "$CDIR"
	cp -rf $DIR/.config/bspwm/ "$CDIR"
	cp -rf $DIR/.config/mpd/ "$CDIR"
	cp -rf $DIR/.config/nvim/ "$CDIR"
	cp -rf $DIR/.config/polybar/ "$CDIR"
	cp -rf $DIR/.config/rofi/ "$CDIR"
}

# Set environment LIBGL SOFTWARE (low gpu)
install_libgl_env() {
	echo -e "\n[*] Installing LIBGL SOFTWARE to env..."
	sudo bash -c "echo -e 'LIBGL_ALWAYS_SOFTWARE=true' >> /etc/environment"
}

sudo sed -i -e "s/EDITOR=nano/EDITOR=vi/g" /etc/environment
# Main
main() {
	clear
	cat <<- EOF
		[*] Ricing bspwm...
		
	EOF

	install_fonts
	install_config_files
	install_libgl_env
}

main
