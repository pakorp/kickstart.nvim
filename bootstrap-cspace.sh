#!/bin/bash

# Detect home dir (in Codespaces, often /home/vscode or /root)
USER_HOME="${HOME:-/home/vscode}"
ALIAS_LINE="alias nvim='NVIM_APPNAME=nvim_dev nvim'"
START_SH="$USER_HOME/start.sh"

# Determine shell and rc file
SHELL_NAME="$(basename "$SHELL")"
RC_FILE="$USER_HOME/.bashrc"  # default fallback

if [[ "$SHELL_NAME" == "zsh" ]]; then
  RC_FILE="$USER_HOME/.zshrc"
elif [[ "$SHELL_NAME" == "bash" ]]; then
  RC_FILE="$USER_HOME/.bashrc"
fi

# 1. Add alias to shell RC file
if ! grep -Fxq "$ALIAS_LINE" "$RC_FILE"; then
  echo "Adding Neovim alias to $RC_FILE..."
  echo "$ALIAS_LINE" >> "$RC_FILE"
else
  echo "Alias already exists in $RC_FILE."
fi

# 2. Create start.sh if it doesn't exist
if [ ! -f "$START_SH" ]; then
  echo "Creating $START_SH..."
  cat << 'EOF' > "$START_SH"
#!/bin/sh
NVIM_APPNAME=nvim_dev nvim "$@"
EOF
  chmod +x "$START_SH"
else
  echo "$START_SH already exists."
fi

# 3. Final message
echo "✅ Bootstrap complete."
echo "🔁 Reload your shell or run: source $RC_FILE"