CONFIG_DIR="$HOME/.config/nvim"

# Default to the latest version if no config is specified
LATEST_VERSION=$(ls -v $CONFIG_DIR | grep -E '^v[0-9]+$' | tail -n 1)
SELECTED_CONFIG="$CONFIG_DIR/$LATEST_VERSION"
SELECTED_VERSION="nvim/$LATEST_VERSION"

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --config|-c) 
            if [ -n "$2" ] && [[ "$2" != -* ]]; then
                SELECTED_CONFIG="$CONFIG_DIR/$2"
                SELECTED_VERSION="nvim/$2"
                shift 2
            else
                echo "Error: --config requires a non-empty option argument."
                exit 1
            fi
            ;;
        *) 
            break
            ;;
    esac
done

# If the configuration directory exists, run nvim with it
if [ -d "$SELECTED_CONFIG" ]; then
    NVIM_APPNAME="$SELECTED_VERSION" nvim "$@"
else
    echo "Configuration directory $SELECTED_CONFIG does not exist."
    exit 1
fi
