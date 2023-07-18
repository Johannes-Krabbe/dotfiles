# Exit if any command fails
set -e

# Check if the correct number of arguments are provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 json_field"
    exit 1
fi

# Assign arguments to variables
json_file=~/.secrets.json
json_field=$1

# Parse the JSON file and copy the field to clipboard
jq -r '."'$json_field'"' "$json_file" | xclip -selection clipboard

echo "Copied $json_field to clipboard."
