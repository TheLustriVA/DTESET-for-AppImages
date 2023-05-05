#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: dteset <AppImage>"
  exit 1
fi

APPIMAGE="$1"

echo "**********************************"
echo "Desktop Entry Setter"
echo "**********************************"

read -p "Path to the AppImage [default: $(pwd)/${APPIMAGE}]: " path
path=${path:-$(pwd)/${APPIMAGE}}

echo "Type:"
echo "1) Application"
echo "2) Link"
echo "3) Directory"
read -p "Choose the type [default: 1]: " type_choice

case "$type_choice" in
  2) type="Link" ;;
  3) type="Directory" ;;
  *) type="Application" ;;
esac

read -p "Name [default: ${APPIMAGE%.AppImage}]: " name
name=${name:-${APPIMAGE%.AppImage}}

read -p "Exec [default: ${path}]: " exec
exec=${exec:-${path}}

read -p "Icon [default: utilities-terminal]: " icon
icon=${icon:-utilities-terminal}

read -p "Categories (semicolon-separated) [default: Utility;Application;]: " categories
categories=${categories:-Utility;Application;}

echo ""
echo "--> The details you entered will result in the following desktop entry:"
echo "[Desktop Entry]"
echo "Type=${type}"
echo "Name=${name}"
echo "Exec=${exec}"
echo "Icon=${icon}"
echo "Categories=${categories}"
echo ""

read -p "Is this correct? Y/n: " confirmation

if [[ "${confirmation,,}" != "n" ]]; then
  mkdir -p ~/.local/share/applications
  echo "[Desktop Entry]" > ~/.local/share/applications/${name}.desktop
  echo "Type=${type}" >> ~/.local/share/applications/${name}.desktop
  echo "Name=${name}" >> ~/.local/share/applications/${name}.desktop
  echo "Exec=${exec}" >> ~/.local/share/applications/${name}.desktop
  echo "Icon=${icon}" >> ~/.local/share/applications/${name}.desktop
  echo "Categories=${categories}" >> ~/.local/share/applications/${name}.desktop
  echo "Desktop entry set."
  echo "**********************************"
else
  echo "Desktop entry not set."
  echo "**********************************"
fi
