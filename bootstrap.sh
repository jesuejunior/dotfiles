#!/usr/bin/env bash
set -euo pipefail

# Starting configuration, checking by OS
if python3 -mplatform 2>/dev/null | grep -qi MANJARO; then
  sudo pacman -Suy dkms tmux ntfs-3g bluez-tools bluez-utils mypaint gimp thunderbird \
    chromium browserpass-chromium browserpass-firefox xclip htop docker docker-compose sbt \
    scala maven pinentry pcsc-tools ack pass pass-otp jq browserpass pyenv python-pip poetry \
    simplescreenrecorder aws-cli --noconfirm
  sudo pacman -Syu $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" \
    | awk '{print $1"-headers"}' ORS=' ') --noconfirm
  sudo usermod -aG docker jj
  sudo usermod -aG users jj
  sudo usermod -aG storage jj
  sudo usermod -aG disk jj
  sudo usermod -aG wheel jj
  sudo systemctl enable docker
  sudo systemctl start docker
  pamac build brightness-controller-git protonvpn protonmail-bridge \
    digimend-kernel-drivers-dkms-git slack-desktop spotify
fi

if python3 -mplatform 2>/dev/null | grep -qi Ubuntu; then
  echo "Configuring and installing docker"
  sudo apt-get remove docker docker-engine docker.io
  sudo apt-get install apt-transport-https ca-certificates curl \
    software-properties-common unzip jq htop
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update

  echo "Installing required packages"
  sudo apt-get install -y curl git tmux zsh vim cmake build-essential docker-ce \
    libssl-dev libreadline-dev zlib1g-dev pcscd scdaemon gnupg2 pcsc-tools \
    libncursesw5-dev libgdbm-dev libc6-dev
fi

if [ "$(uname)" = "Darwin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install --cask font-hack-nerd-font font-source-code-pro
  brew install python3 cmake tmux htop ack coreutils gnu-sed git git-flow gnupg httpie jq \
    zsh tree wget pyenv pipenv zbar browserpass gpg pinentry pinentry-mac pass pass-otp \
    pipx protobuf postgresql openssl@1.1
  sudo pipx install poetry
  poetry self add poetry-dotenv-plugin
  PREFIX='/opt/homebrew/opt/browserpass' make hosts-chrome-user \
    -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'
  PREFIX='/opt/homebrew/opt/browserpass' make hosts-firefox-user \
    -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'
fi

# Rust toolchain
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup default stable
rustup component add rust-src
cargo install cross --git https://github.com/cross-rs/cross

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh && chsh -s "$(which zsh)"
mkdir -p ~/code ~/.ssh ~/.gnupg
cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

# VIM
ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vim/vimrc ~/.vimrc

# Install vim-plug plugins and LSP servers
vim -es -u ~/.vimrc +PlugInstall +qall 2>/dev/null || true
vim -es -c "e /tmp/_.py" -c "LspInstallServer --confirm pylsp" +qall 2>/dev/null || true
vim -es -c "e /tmp/_.rs" -c "LspInstallServer --confirm rust-analyzer" +qall 2>/dev/null || true
vim -es -c "VimspectorInstall CodeLLDB" +qall 2>/dev/null || true

# GIT
ln -snf ~/dotfiles/git/config ~/.ssh/config
ln -snf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -snf ~/dotfiles/tmux.conf ~/.tmux.conf

# GPG
sudo mkdir -p /usr/local/bin
sudo ln -snf "$(which gpg)" /usr/local/bin/gpg
ln -snf ~/dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -snf ~/dotfiles/gpg/sshcontrol ~/.gnupg/sshcontrol
ln -snf ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
gpg-connect-agent updatestartuptty /bye
gpg --import gpg/jesuejunior.pub
git clone git@github.com:jesuejunior/pass.git ~/.password-store

gpgconf --kill gpg-agent

# Fonts
cd ~/dotfiles/fonts && bash install.sh
