#!/bin/bash
# OpenClaw Model Manager - raspi-config style TUI
# Uses whiptail for menu navigation

CONFIG="$HOME/.openclaw/openclaw.json"
BACKUP_DIR="$HOME/.openclaw/backups"
TEST_FILE="/tmp/model-manager-test.json"

# Check whiptail
if ! command -v whiptail &> /dev/null; then
    echo "Installing whiptail..."
    sudo apt-get install -y whiptail
fi

CMD="${1:-menu}"

show_menu() {
    whiptail --title "🦞 OpenClaw Model Manager" --menu \
        "Choose an option:" 15 60 8 \
        "1" "Add Custom Model" \
        "2" "List All Models" \
        "3" "Test Connections" \
        "4" "Set Default Model" \
        "5" "View Current Model" \
        "6" "Backup Config" \
        "7" "Restore Config" \
        "8" "Remove Model" \
        "9" "View Providers" \
        "Q" "Quit" 3>&1 1>&2 2>&3
}

add_model() {
    # Use whiptail --form for input
    whiptail --title "Add Custom Model" --form \
        "Fill in the details:" 12 60 5 \
        "Provider:" 1 1 "ollama" 1 20 30 0 \
        "Base URL:" 2 1 "http://127.0.0.1:11434/v1" 2 20 40 0 \
        "API Key:" 3 1 "" 3 20 50 0 \
        "Model ID:" 4 1 "llama3" 4 20 30 0 \
        "Name:" 5 1 "LLaMA 3" 5 20 30 0 \
        3>&1 1>&2 2>&3
}

# Handle commands
case "$CMD" in
    menu|m)
        show_menu
        ;;
    add|1)
        add_model
        ;;
    list|2)
        whiptail --title "Models" --msgbox "$(openclaw models list 2>&1)" 20 70
        ;;
    test|3)
        whiptail --title "Connection Test" --msgbox "$(openclaw models status 2>&1 | grep -A5 Auth)" 15 60
        ;;
    default|4)
        whiptail --title "Default Model" --msgbox "$(openclaw models status 2>&1 | grep Default)" 10 40
        ;;
    backup|6)
        mkdir -p "$BACKUP_DIR"
        cp "$CONFIG" "$BACKUP_DIR/config-$(date +%Y%m%d-%H%M%S).json"
        whiptail --title "Backup" --msgbox "✅ Config backed up" 8 40
        ;;
    providers|9)
        whiptail --title "Providers" --msgbox "$(openclaw config get models.providers 2>&1 | jq 'keys')" 10 40
        ;;
    help|--help|"")
        echo "Usage: model-manager.sh <command>"
        echo "  menu/m     - TUI menu (like raspi-config)"
        echo "  add/1      - Add model"
        echo "  list/2     - List models"
        echo "  test/3     - Test connections"
        echo ""
        echo "Run without args for TUI: model-manager.sh"
        ;;
    *)
        echo "Run: model-manager.sh menu"
        ;;
esac
