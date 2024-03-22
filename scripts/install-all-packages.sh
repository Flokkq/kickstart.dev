#!/bin/bash

base_dir="$HOME/kickstart.dev/package-managers"

for pm_dir in "$base_dir"/*/; do
    pm_name=$(basename "$pm_dir")
    txt_file=$(find "$pm_dir" -name "$pm_name.txt") # Find the .txt file corresponding to the package manager

    if [[ -f "$txt_file" ]]; then
        echo "Installing packages for $pm_name"

        read -r install_command < "$txt_file"

        sed 1d "$txt_file" | while read -r package; do
            full_command="$install_command $package"
            echo "Executing: $full_command"
            eval "$full_command"
        done
    else
        echo "No $pm_name.txt found in $pm_dir"
    fi
done
