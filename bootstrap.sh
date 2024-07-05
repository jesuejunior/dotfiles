# Starting configuration, checking by SO
python -mplatform | grep -i MANJARO
if [ $? = 0 ]
then
 sudo pacman -Suy dkms tmux ntfs-3g bluez-tools bluez-utils mypaint gimp thunderbird chromium browserpass-chromium browserpass-firefox xclip htop docker docker-compose sbt scala maven pinentry pcsc-tools ack pass pass-otp jq browserpass pyenv python-pip poetry simplescreenrecorder aws-cli --noconfirm
 sudo pacman -Syu $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-headers"}' ORS=' ') --noconfirm
 sudo usermod -aG docker jj
 sudo usermod -aG users jj
 sudo usermod -aG storage jj
 sudo usermod -aG disk jj
 sudo usermod -aG wheel jj
 sudo systemctl enable docker
 sudo systemctl start docker
 pamac build brightness-controller-git protonvpn protonmail-bridge digimend-kernel-drivers-dkms-git slack-desktop spotify

 #TODO: Install firefox nighly from url and create shortcut
fi

python -mplatform | grep -i Ubuntu
if [ $? = 0 ]
then

echo "Configuring and installing docker"
#echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common unzip jq htop
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

echo "Installing required packages"
sudo apt-get install -y curl git tmux zsh vim python-pip cmake build-essential \
	docker-ce libssl-dev libreadline-dev zlib1g-dev pcscd scdaemon gnupg2 pcsc-tools libncursesw5-dev \
	libgdbm-dev libc6-dev libssl-dev
# Installing pyenv on Ubuntu
#git clone https://github.com/pyenv/pyenv.git ~/.pyenv

fi

if [ `uname` = "Darwin" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap Amar1729/homebrew-formulae
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font font-source-code-pro
    brew install python3 cmake tmux htop ack coreutils gnu-sed git git-flow gnupg httpie jq \
    zsh tree wget pyenv pipenv zbar browserpass gpg pinentry pinentry-mac pass pass-otp \
    gpg nvim pipx protobuf postgresql openssl@1.1
    python3 get-pip.py
	sudo pip3 install -U pip docker-compose
	sudo pipx install poetry
	poetry self add poetry-dotenv-plugin
	# browserpass extension activation
	#PREFIX='/opt/homebrew/opt/browserpass' make hosts-chromium-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'
	PREFIX='/opt/homebrew/opt/browserpass' make hosts-chrome-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'	
	PREFIX='/opt/homebrew/opt/browserpass' make hosts-firefox-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'
fi

# Isntalling rust and racer to vim
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup default nightly
# rustup component add racer
# rustup toolchain add nightly
# cargo +nightly install racer
# rustup component add rust-src
cargo install cross --git https://github.com/cross-rs/cross

if [[ ! -z "${IS_CODESPACE}" ]]; then
	echo "It is running on codespaces"
    ln -sf /workspaces/.codespaces/.persistedshare/dotfiles ~/dotfiles

	# Trying to change to zsh without ask password
	grep -qxF "$(which zsh)" "/etc/shells" || sudo bash -c "echo $(which zsh) >> /etc/shells"
	grep -qxF "$(which zsh)" "/etc/shells" && sudo chsh -s "$(which zsh)" "$(whoami)"
fi

# get oh my zsh
curl -L http://install.ohmyz.sh | sh && chsh -s `which zsh`


cd ~/dotfiles
git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

# VIM
ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vim/vimrc ~/.vimrc

# GIT
ln -snf ~/dotfiles/git/config ~/.ssh/config
ln -snf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -snf ~/dotfiles/tmux.conf ~/.tmux.conf

# GPG links
if [[ -z "${IS_CODESPACE}" ]]; then
mkdir -p ~/code ~/.ssh ~/.gnupg
sudo mkdir -p /usr/local/bin
sudo ln -snf `which gpg` /usr/local/bin/gpg
ln -snf ~/dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -snf ~/dotfiles/gpg/sshcontrol ~/.gnupg/sshcontrol
ln -snf ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
gpg-connect-agent updatestartuptty /bye
gpg --import gpg/jesuejunior.pub
git clone git@github.com:jesuejunior/pass.git ~/.password-store
gpgconf --kill gpg-agent

# Install fonts pretty good
cd ~/dotfiles/fonts && bash install.sh
#vim +PluginInstall +qall

#Adding plugin to zsh-nvm
#git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# install sdkman
#curl -s "https://get.sdkman.io" | sudo bash
fi
