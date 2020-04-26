#!/usr/bin/env bash

set -e

################################################################################
### Head: mx-linux
##
mx_config_install () {

	mx_config_install_disable_autostart

}

mx_config_install_disable_autostart () {

	echo "rm -f $HOME/.config/autostart/pulse-start.desktop"
	rm -f "$HOME/.config/autostart/pulse-start.desktop"

	echo "rm -f $HOME/.config/autostart/volumeicon.desktop"
	rm -f "$HOME/.config/autostart/volumeicon.desktop"

}

##
### Tail: mx-linux
################################################################################


################################################################################
### Head: xfce4
##
xfce4_config_install () {
	mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
	echo "mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"

	cp ./config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
	echo "cp ./config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml"


	mkdir -p $HOME/.config/xfce4/panel
	echo "mkdir -p $HOME/.config/xfce4/panel"

	cp ./config/xfce4/panel/whiskermenu-1.rc $HOME/.config/xfce4/panel/whiskermenu-1.rc
	echo "cp ./config/xfce4/panel/whiskermenu-1.rc $HOME/.config/xfce4/panel/whiskermenu-1.rc"


	cp ./config/xfce4/helpers.rc $HOME/.config/xfce4/helpers.rc
	echo "cp ./config/xfce4/helpers.rc $HOME/.config/xfce4/helpers.rc"


}

##
### Tail: xfce4
################################################################################


################################################################################
### Head: theme
##
theme_config_install () {

	theme_config_install_wm_theme
	theme_config_install_ui_theme
	theme_config_install_icon_theme
	theme_config_install_cursor_theme

}

theme_config_install_wm_theme () {

	## ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
	## <property name="theme" type="string" value="Numix"/>

	echo "xfconf-query -c 'xfwm4' -p '/general/theme' -s 'Numix'"
	xfconf-query -c 'xfwm4' -p '/general/theme' -s 'Numix'

}

theme_config_install_ui_theme () {

	## ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
	## <property name="ThemeName" type="string" value="Numix"/>

	echo "xfconf-query -c 'xsettings' -p '/Net/ThemeName' -s 'Numix'"
	xfconf-query -c 'xsettings' -p '/Net/ThemeName' -s 'Numix'

}

theme_config_install_icon_theme () {

	## ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
	## <property name="IconThemeName" type="string" value="Numix"/>

	echo "xfconf-query -c 'xsettings' -p '/Net/IconThemeName' -s 'Numix'"
	xfconf-query -c 'xsettings' -p '/Net/IconThemeName' -s 'Numix'

}

theme_config_install_cursor_theme () {

	## ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

	## <property name="CursorThemeName" type="string" value="default"/>
	## <property name="CursorThemeSize" type="int" value="24"/>

	## <property name="CursorThemeName" type="string" value="breeze_cursors"/>
	## <property name="CursorThemeSize" type="int" value="24"/>

	## <property name="CursorThemeName" type="string" value="Breeze_Snow"/>
	## <property name="CursorThemeSize" type="int" value="24"/>


	echo "xfconf-query -c 'xsettings' -p '/Gtk/CursorThemeName' -s 'breeze_cursors'"
	xfconf-query -c 'xsettings' -p '/Gtk/CursorThemeName' -s "breeze_cursors"

	echo "xfconf-query -c 'xsettings' -p '/Gtk/CursorThemeSize' -s '24'"
	xfconf-query -c 'xsettings' -p '/Gtk/CursorThemeSize' -s "24"

}

##
### Tail: theme
################################################################################


################################################################################
### Head: compton
##
compton_config_install () {

	## $ dpkg -L compton | grep conf
	## /usr/share/doc/compton/examples/compton.sample.conf
	## cp $(dpkg -L compton | grep conf) ~/.config/compton.conf

	echo "cp ./config/compton/compton.conf $HOME/.config/compton.conf"
	cp "./config/compton/compton.conf" "$HOME/.config/compton.conf"

	compton_config_install_autostart
}

compton_config_install_autostart () {

	# $ dpkg -L mx-tweak | grep zcompton
	# /usr/share/mx-tweak/zcompton.desktop

	#echo "/usr/share/mx-tweak/zcompton.desktop $HOME/.config/autostart/zcompton.desktop"
	#cp '/usr/share/mx-tweak/zcompton.desktop' "$HOME/.config/autostart/zcompton.desktop"

	echo "./config/compton/zcompton.desktop $HOME/.config/autostart/zcompton.desktop"
	cp "./config/compton/zcompton.desktop" "$HOME/.config/autostart/zcompton.desktop"

}
##
### Tail: compton
################################################################################



################################################################################
### Head: mousepad
##
mousepad_config_install () {

	echo
	echo 'mousepad_config_install'
	echo

	gsettings set org.xfce.mousepad.preferences.view show-whitespace true
	gsettings set org.xfce.mousepad.preferences.view smart-home-end 'disabled'
	#gsettings set org.xfce.mousepad.preferences.view color-scheme 'builder-dark'
	#gsettings set org.xfce.mousepad.preferences.view color-scheme 'oblivion'
	gsettings set org.xfce.mousepad.preferences.view color-scheme 'matcha'
	gsettings set org.xfce.mousepad.preferences.view show-right-margin true
	gsettings set org.xfce.mousepad.preferences.view show-line-marks false
	gsettings set org.xfce.mousepad.preferences.view show-line-endings false
	gsettings set org.xfce.mousepad.preferences.view indent-on-tab true
	gsettings set org.xfce.mousepad.preferences.view auto-indent true
	gsettings set org.xfce.mousepad.preferences.view insert-spaces false
	gsettings set org.xfce.mousepad.preferences.view tab-width 4
	gsettings set org.xfce.mousepad.preferences.view highlight-current-line true
	gsettings set org.xfce.mousepad.preferences.view show-line-numbers true
	gsettings set org.xfce.mousepad.preferences.view word-wrap true
	gsettings set org.xfce.mousepad.preferences.view use-default-monospace-font false
	gsettings set org.xfce.mousepad.preferences.view indent-width -1
	gsettings set org.xfce.mousepad.preferences.view font-name 'Monospace 14'
	gsettings set org.xfce.mousepad.preferences.view right-margin-position 80
	gsettings set org.xfce.mousepad.preferences.view match-braces true
	gsettings set org.xfce.mousepad.preferences.window remember-size true
	gsettings set org.xfce.mousepad.preferences.window statusbar-visible false
	gsettings set org.xfce.mousepad.preferences.window menubar-visible-in-fullscreen 'auto'
	gsettings set org.xfce.mousepad.preferences.window toolbar-visible true
	gsettings set org.xfce.mousepad.preferences.window statusbar-visible-in-fullscreen 'auto'
	gsettings set org.xfce.mousepad.preferences.window toolbar-visible-in-fullscreen 'auto'
	gsettings set org.xfce.mousepad.preferences.window recent-menu-items 10
	gsettings set org.xfce.mousepad.preferences.window cycle-tabs true
	gsettings set org.xfce.mousepad.preferences.window always-show-tabs true
	gsettings set org.xfce.mousepad.preferences.window path-in-title true
	gsettings set org.xfce.mousepad.preferences.window default-tab-sizes '2,3,4,8'
	gsettings set org.xfce.mousepad.preferences.window toolbar-style 'icons'
	gsettings set org.xfce.mousepad.preferences.window menubar-visible true
	gsettings set org.xfce.mousepad.preferences.window remember-position false
	gsettings set org.xfce.mousepad.preferences.window remember-state true
	gsettings set org.xfce.mousepad.preferences.window toolbar-icon-size 'small-toolbar'

}

##
### Tail: mousepad
################################################################################


################################################################################
### Head: xfce4_terminal
##
xfce4_terminal_config_install () {

	echo "mkdir -p $HOME/.config/xfce4/terminal"
	mkdir -p "$HOME/.config/xfce4/terminal"

	echo "cp ./config/xfce4-terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc"
	cp "./config/xfce4-terminal/terminalrc" "$HOME/.config/xfce4/terminal/terminalrc"

}

##
### Tail: xfce4_terminal
################################################################################


################################################################################
### Head: rofi
##
rofi_config_install () {
	mkdir -p "$HOME/.config/rofi"
	echo "mkdir -p $HOME/.config/rofi"

	cp "./config/rofi/config" "$HOME/.config/rofi/config"
	echo "cp ./config/rofi/config $HOME/.config/rofi/config"

	rofi_put_app_desktop_entry
}

rofi_put_app_desktop_entry () {
	mkdir -p "$HOME/.local/share/applications"
	echo "mkdir -p $HOME/.local/share/applications"

	cp "./config/rofi/rofi-show-drun.desktop" "$HOME/.local/share/applications/rofi-show-drun.desktop"
	echo "cp ./config/rofi/rofi-show-drun.desktop $HOME/.local/share/applications/rofi-show-drun.desktop"

	cp "./config/rofi/rofi-show-run.desktop" "$HOME/.local/share/applications/rofi-show-run.desktop"
	echo "cp ./config/rofi/rofi-show-run.desktop $HOME/.local/share/applications/rofi-show-run.desktop"

	cp "./config/rofi/rofi-show-window.desktop" "$HOME/.local/share/applications/rofi-show-window.desktop"
	echo "cp ./config/rofi/rofi-show-window.desktop $HOME/.local/share/applications/rofi-show-window.desktop"

}
##
### Tail: rofi
################################################################################


################################################################################
### Head: fcitx
##
fcitx_config_install () {
	mkdir -p $HOME/.config/fcitx
	echo "mkdir -p $HOME/.config/fcitx"

	cp ./config/fcitx/profile $HOME/.config/fcitx/profile
	echo "cp ./config/fcitx/profile $HOME/.config/fcitx/profile"

	fcitx_config_install_im_config

}

fcitx_config_install_im_config () {
	echo
	im-config -n fcitx
	echo "im-config -n fcitx"
	echo "cat ~/.xinputrc"
	cat ~/.xinputrc
	echo
}
##
### Tail: fcitx
################################################################################


################################################################################
### Head: gtk3
##
gtk3_config_install () {
	mkdir -p $HOME/.config/gtk-3.0
	echo "mkdir -p $HOME/.config/gtk-3.0"

	cp ./config/gtk3/settings.ini $HOME/.config/gtk-3.0/settings.ini
	echo "cp ./config/gtk3/settings.ini $HOME/.config/gtk-3.0/settings.ini"
}
##
### Tail: gtk3
################################################################################


################################################################################
### Head: gtk2
##
gtk2_config_install () {

	cp ./config/gtk2/.gtkrc-2.0 $HOME/.gtkrc-2.0
	echo "cp ./config/gtk2/.gtkrc-2.0 $HOME/.gtkrc-2.0"

}
##
### Tail: gtk2
################################################################################


################################################################################
### Head: main
##
main_config_install () {

	mx_config_install

	xfce4_config_install
	
	compton_config_install

	xfce4_terminal_config_install

	rofi_config_install

	fcitx_config_install

	gtk3_config_install

	gtk2_config_install

	theme_config_install
	
	mousepad_config_install

}
## start
main_config_install

##
### Tail: main
################################################################################
