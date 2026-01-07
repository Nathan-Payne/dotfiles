#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up dotfiles...${NC}"

# Create config directories if they don't exist
mkdir -p ~/.config

# neovim
echo -e "${GREEN}Linking nvim config...${NC}"
ln -sf ~/dotfiles/nvim ~/.config/nvim

# tmux
echo -e "${GREEN}Linking tmux config...${NC}"
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Broot
echo -e "${GREEN}Linking broot config...${NC}"
ln -sf ~/dotfiles/broot ~/.config/broot

# Lazygit
echo -e "${GREEN}Linking lazygit config...${NC}"
ln -sf ~/dotfiles/lazygit ~/.config/lazygit

echo -e "${BLUE}Dotfiles setup complete!${NC}"
