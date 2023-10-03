#!/usr/bin/env bash

# Install script for bspwm ricing

# Dirs
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"
CDIR="$HOME/.config"

# Ask confirmation
ask_confirm() {
    read -p "${1} (y/N): "  -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # do dangerous stuff
        true
    else
        false
    fi
}

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

# Set mouse cursor size
set_mouse_cursors_size() {
	echo -e "! ------------------------------------------------------------------------------\n! Mouse Size\n! ------------------------------------------------------------------------------\nXcursor.size: 14" >> ~/.Xresources
}

# Set vi as default editor
set_editor_vi() {
	sudo sed -i -e "s/EDITOR=nano/EDITOR=vi/g" /etc/environment
}

# Configure polybar modules based on system hardware
config_polybar() {
    echo -e "\n[*] Configuring polybar..."
    # modules-right = battery alsa brightness sep wireless-network sep date sep sysmenu
    modules="modules-right = "
    if ask_confirm "Battery available"; then modules+="battery " ; fi
    if ask_confirm "Brightness available"; then modules+="brightness " ; fi
    modules+="alsa "
    if ask_confirm "Wireless available"; then modules+="sep wireless-network " ; fi
    modules+="sep date sep sysmenu"

	echo -e "\n + New modules: $modules"
    sed -i -e "s/modules-right = .*/${modules}/g" $CDIR/polybar/config_single.ini
	sed -i -e "s/modules-right = .*/${modules}/g" $CDIR/polybar/config_dual.ini
}

# Main
main() {
	clear
	cat <<- EOF
		[*] Ricing bspwm...
		
	EOF

	install_fonts
	install_config_files
	if ask_confirm "Confirm installation libgl to env"; then install_libgl_env; fi
 	set_mouse_cursors_size
	if ask_confirm "Confirm vi as default editor"; then set_editor_vi; fi
    if ask_confirm "Confirm polybar configuration"; then config_polybar; fi
}

main
