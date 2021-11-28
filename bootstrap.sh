# Starting configuration, checking by SO
python -mplatform | grep -i MANJARO
if [ $? = 0 ]
then
 sudo pacman -Suy dkms tmux ntfs-3g bluez-tools bluez-utils mypaint thunderbird chromium browserpass-chromium browserpass-firefox xclip docker sbt scala maven pinentry pcsc-tools ack pass pass-otp jq browserpass pyenv python-pip poetry simplescreenrecorder aws-cli --noconfirm
 sudo pacman -Syu $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-headers"}' ORS=' ') --noconfirm
 sudo usermod -aG docker $USER
 sudo usermod -aG users $USER
 sudo usermod -aG storage $USER
 sudo usermod -aG disk $USER
 sudo usermod -aG wheel $USER
 sudo systemctl enable docker
 sudo systemctl start docker
 pamac build brightness-controller-git
 pamac build digimend-kernel-drivers-dkms-git

 #TODO: Install firefox nighly from url and create shortcut
 gpg --import ~/dotfiles/gpg/jesuejunior.pub
 git clone git@github.com:jesuejunior/pass.git ~/.password-store
fi

python -mplatform | grep -i Ubuntu
if [ $? = 0 ]
then

echo "Configuring and installing docker"

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

echo "Installing required packages"
sudo apt-get install -y curl git tmux zsh vim python-pip cmake build-essential dkms scala sbt ruby \
	docker-ce guake libssl-dev libreadline-dev zlib1g-dev pcscd scdaemon gnupg2 pcsc-tools libncursesw5-dev \
	libgdbm-dev libc6-dev libssl-dev
# Installing pyenv on Ubuntu
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

fi

if [ `uname` = "Darwin" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap Amar1729/homebrew-formulae
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font font-source-code-pro
    brew install python3 cmake tmux htop ack coreutils gnu-sed git git-flow gnupg httpie jq \
    zsh tree wget scala sbt pyenv pipenv zbar browserpass gpg pinentry pinentry-mac pass pass-otp \
    librdkafka
    #brew install vim --with-python --with-ruby --with-perl

    brew install macvim --env-std --override-system-vim
    sudo easy_install pip
    #sudo pip install --ignore-installed six
	sudo pip install docker-compose
    python3 get-pip.py
    pip3 install --user python-language-server[all] isort
	# activing browserpass extension
	PREFIX='/usr/local/opt/browserpass' make hosts-firefox-user -f /usr/local/opt/browserpass/lib/browserpass/Makefile
	PREFIX='/usr/local/opt/browserpass' make hosts-chrome-user -f /usr/local/opt/browserpass/lib/browserpass/Makefile
fi

python -mplatform | grep -i centos
if [ $? = 0 ]
then
    sudo yum update -y
    sudo yum install -y cmake python-devel zsh git python-pip yum-utils \
    gcc kernel-devel kernel-headers make bzip2 cmake epel-release \
    tmux dkms python-devel mysql-devel net-tools htop vim
    sudo yum groupinstall "Development Tools" -y
    sudo yum-builddep python
    curl -O https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
    tar xf Python-3.5.0.tgz
    cd Python-3.5.0
    ./configure
    make
    sudo make install
    cd ..
    sudo rm -rf Python-3.5.0*
fi

# Isntalling rust and racer to vim
curl https://sh.rustup.rs -sSf | sh
rustup default nightly
rustup component add racer
rustup toolchain add nightly
cargo +nightly install racer
rustup component add rust-src

# get oh my zsh
curl -L http://install.ohmyz.sh | sh && chsh -s `which zsh`

mkdir ~/gocode ~/code ~/.ssh
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
sudo ln -snf `which gpg` /usr/local/bin/gpg
ln -snf ~/dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -snf ~/dotfiles/gpg/sshcontrol ~/.gnupg/sshcontrol
ln -snf ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Emacs
#ln -snf ~/dotfiles/emacs/.spacemacs ~/.spacemacs

sudo pip install virtualenvwrapper
# Install fonts pretty good
cd ~/dotfiles/fonts && bash install.sh
vim +PluginInstall +qall

#Adding plugin to zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# install sdkman
curl -s "https://get.sdkman.io" | bash

#git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#cd ~/.rbenv; src/configure && make -C src && ./src/configure
#rbenv init
#mkdir -p "$(rbenv root)"/plugins
#git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

