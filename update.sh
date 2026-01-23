#!/bin/bash
# OpenEuroLLM Cluster Environment Updater
# Re-downloads configuration files while preserving local config

set -e

GITHUB_BASE_URL="https://raw.githubusercontent.com/OpenEuroLLM/clusterenv/main"
INSTALL_DIR="$HOME/.openeurollm-env"
CLUSTERS=(lumi leonardo jupiter juwels local)

if [ ! -f "$INSTALL_DIR/config.sh" ]; then
    echo "Error: OpenEuroLLM environment not installed."
    echo "Run the installer first:"
    echo "  curl -sSL $GITHUB_BASE_URL/install.sh | bash"
    exit 1
fi

echo "Updating OpenEuroLLM cluster environment..."

# Download updated configuration files
echo "Downloading latest configuration files..."
curl -sSL "$GITHUB_BASE_URL/common.sh" -o "$INSTALL_DIR/common.sh"

for cluster in "${CLUSTERS[@]}"; do
    curl -sSL "$GITHUB_BASE_URL/clusters/${cluster}.sh" -o "$INSTALL_DIR/clusters/${cluster}.sh"
done

# Update self
curl -sSL "$GITHUB_BASE_URL/update.sh" -o "$INSTALL_DIR/update.sh"
chmod +x "$INSTALL_DIR/update.sh"

echo ""
echo "Update complete!"
echo "To apply changes, run:"
echo "  source $INSTALL_DIR/config.sh"
