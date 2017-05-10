#First things to do
#
#create/copy a ssh key
#sudo chmod 400 jesuejunior.key
#wget config
#sudo chmod 600 ~/.ssh/config

python -mplatform | grep -i Ubuntu
if [ $? = 0 ]
then
sudo apt-get install curl git tmux zsh vim python-pip cmake

fi

if [ `uname` = "Darwin" ]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python3 cmake
    brew install vim --with-python --with-ruby --with-perl
    brew install macvim --env-std --override-system-vim
    sudo easy_install pip
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

mkdir ~/gocode
mkdir ~/code

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
cd vim/bundle/YouCompleteMe/
./install.py

#Adding plugin to zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

chsh -s /bin/zsh
