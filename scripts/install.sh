#!/bin/bash

# Define the path to the README.md file
README_PATH="$HOME/kickstart.dev/README.md"

# Initialize an empty array for dependencies
DEPENDENCIES=()

#  parse the README.md file and build the dependencies array
while IFS= read -r line; do
    if [[ $line == "brew install"* ]]; then
        # Extract the package name, considering the '--cask' option
        if [[ $line == *" --cask "* ]]; then
            package=$(echo $line | sed -E 's/brew install --cask (.*)/\1/')
        else
            package=$(echo $line | sed -E 's/brew install (.*)/\1/')
        fi
        # Add the extracted package name to the dependencies array
        DEPENDENCIES+=("$package")
    fi
done < "$README_PATH"

# Function to handle package installation and catch errors
install_package() {
    package_name=$1
    install_command=$2
    if ! eval "$install_command $package_name"; then
        echo "$package_name not found - you have to install it manually."
    fi
}

# Detect the operating system and install packages
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case $ID in
        ubuntu|debian)
            for package in "${DEPENDENCIES[@]}"; do
                install_package "$package" "sudo apt update && sudo apt install -y"
            done
            ;;
        fedora|rhel|centos)
            for package in "${DEPENDENCIES[@]}"; do
                # Use DNF for Fedora and newer RedHat/CentOS, YUM for older versions
                [[ $(type -P dnf) ]] && install_package "$package" "sudo dnf install -y" || install_package "$package" "sudo yum install -y"
            done
            ;;
        arch|manjaro)
            for package in "${DEPENDENCIES[@]}"; do
                install_package "$package" "sudo pacman -Syu --noconfirm"
            done
            ;;
        *)
            echo "Unsupported Linux distribution."
            exit 1
            ;;
    esac
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    for package in "${DEPENDENCIES[@]}"; do
      if ! brew install $package; then
        echo "$package not found - you have to install it manually."
      fi
    done
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Installation of dependencies completed."
