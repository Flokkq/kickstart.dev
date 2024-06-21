#!/bin/bash

base_dir="$HOME/kickstart.dev/package-managers"

brew_install_command="brew install"
nix_install_command="nix-env -iA"

echo "Select an option to install packages:"
echo "1) All nix + brew"
echo "2) All but only using brew (will install the packages nix would install)"
echo "3) Only brew"
echo "4) Only nix"
read -rp "Enter your choice [1-4]: " choice

install_packages() {
    pm_name=$1
    txt_file=$2
    install_command=$3

    if [[ -f "$txt_file" ]]; then
        echo "Installing packages for $pm_name"

        sed 1d "$txt_file" | while read -r package; do
            full_command="$install_command $package"
            echo "Executing: $full_command"
            # eval "$full_command"
        done
    else
        echo "No $pm_name.txt found"
    fi
}

case $choice in
    1)
        echo "Installing all nix + brew packages"
        install_packages "brew" "$base_dir/brew/brew.txt" "$brew_install_command"
        install_packages "nix" "$base_dir/nix/nix.txt" "$nix_install_command"
        ;;
    2)
        echo "Installing all packages but only using brew (including nix packages)"
        install_packages "brew" "$base_dir/brew/brew.txt" "$brew_install_command"
        install_packages "brew" "$base_dir/brew/nix-as-brew.txt" "$brew_install_command"
        ;;
    3)
        echo "Installing only brew packages"
        install_packages "brew" "$base_dir/brew/brew.txt" "$brew_install_command"
        ;;
    4)
        echo "Installing only nix packages"
        install_packages "nix" "$base_dir/nix/nix.txt" "$nix_install_command"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
