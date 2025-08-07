#!/bin/bash

# Constants
ALIAS_LINE="alias nvim='NVIM_APPNAME=nvim_dev nvim'"
BASHRC="$HOME/.bashrc"
START_SH="$HOME/start.sh"

# 1. Add alias to .bashrc if it doesn't already exist
if ! grep -Fxq "$ALIAS_LINE" "$BASHRC"; then
  echo "Adding Neovim alias to $BASHRC..."
  echo "$ALIAS_LINE" >> "$BASHRC"
else
  echo "Alias already exists in $BASHRC."
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

# 3. Prompt to reload shell or do it
echo "Done. To apply the alias, run: source $BASHRC"