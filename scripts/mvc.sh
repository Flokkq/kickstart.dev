declare -A directories
directories[pico]="/privat/Security/ctf/pico"

function mvc() {
  local num_args="$#"
  if [ "$num_args" -lt 3 ]; then
    echo "Usage: mvc destination_key file1 [file2 ...] destination_directory"
    return 1
  fi
  
  if [ -z "${ICLOUD_DIR}" ]; then
    echo "ICLOUD_DIR is not set."
    return 1
  fi

  local dest_key="$1"
  local pico_path="${ICLOUD_DIR}${directories[$dest_key]}"
  local dest_dir="${pico_path}/${!#}"  # Using ${!#} to reference the last argument
  
  mkdir -p "$dest_dir"

  for file in "${@:2:$((num_args-2))}"; do 
    mv "$file" "$dest_dir/"
  done 

  echo "Files moved to $dest_dir"
}

