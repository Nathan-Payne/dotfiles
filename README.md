# Personal Dotfiles

Configuration files for terminal tools.

## Tools Configured
- **neovim**: Text editor configuration
- **tmux**: Terminal multiplexer
- **broot**: File tree navigator
- **lazygit**: Git TUI

## Update Configs

```bash
git clone https://github.com/Nathan-Payne/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Tool Installation
Terminal restart required once complete.
Broot will prompt to approve automatic shell function installation (https://dystroy.org/broot/install-br/), hit y.

```
sudo apt update && \
sudo apt install build-essential && \
sudo add-apt-repository ppa:neovim-ppa/unstable -y && \
sudo apt update && \
sudo apt install neovim tmux curl -y && \
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && \
source ~/.cargo/env && \
cargo install broot && \
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
tar xf lazygit.tar.gz lazygit && \
sudo install lazygit /usr/local/bin && \
rm lazygit.tar.gz lazygit && \
cargo install ripgrep
```
