# Initialize the directory stack
declare -a dir_stack

# Function to update the stack when changing directories
function _pushd {
    dir_stack=("$PWD" "${dir_stack[@]}")
    if [ ${#dir_stack[@]} -gt 20 ]; then
        dir_stack=("${dir_stack[@]:0:20}")
    fi
    builtin cd "$@" 
}

# Override the cd command
alias cd=_pushd

# Function to go back
function back {
    if [ $# -eq 0 ]; then
        jump=1
    else
        jump=$1
        if ! [[ "$jump" =~ ^[0-9]+$ ]]; then
            echo "Error: Argument must be a number."
            return 1
        fi
    fi
    
    if [ $jump -lt ${#dir_stack[@]} ]; then
        builtin cd "${dir_stack[jump]}"
        dir_stack=("${dir_stack[@]:$jump}")
    else
        echo "Error: Only ${#dir_stack[@]} directories in history."
    fi
}

