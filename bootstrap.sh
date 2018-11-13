#First things to do
#
#create/copy a ssh key
#sudo chmod 400 jesuejunior.key
#wget config
#sudo chmod 600 ~/.ssh/config

python -mplatform | grep -i Ubuntu
if [ $? = 0 ]
then

echo "Configuring and installing docker" 

sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

echo "Installing needed packages" 
sudo apt-get install curl git tmux zsh vim python-pip cmake build-essential dkms scala ruby docker-ce guake

fi

if [ `uname` = "Darwin" ]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python3 cmake tmux htop
    brew install vim --with-python --with-ruby --with-perl
    brew install macvim --env-std --override-system-vim
    sudo easy_install pip
    sudo pip install --ignore-installed six
	brew install go dep glide
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

# get oh my zsh
curl -L http://install.ohmyz.sh | sh

mkdir ~/gocode  ~/code ~/.ssh 

cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vim/vimrc ~/.vimrc

ln -snf ~/dotfiles/git/config ~/.ssh/config

ln -snf  ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -snf ~/dotfiles/tmux.conf ~/.tmux.conf


sudo pip install virtualenvwrapper
# Install fonts pretty good
cd ~/dotfiles/fonts && bash install.sh
vim +PluginInstall +qall

#Fixing youcompleteme plugin
./vim/bundle/YouCompleteMe/install.py

#Adding plugin to zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv; src/configure && make -C src && ./src/configure
rbenv init


chsh -s /bin/zsh
