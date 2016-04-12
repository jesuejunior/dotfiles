#First things to do
#
#create/copy a ssh key
#sudo chmod 400 jesuejunior.key
#wget config
#sudo chmod 600 ~/.ssh/config


# get oh my zsh
curl -L http://install.ohmyz.sh | sh

cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vim/vimrc ~/.vimrc

ln -snf ~/dotfiles/git/config ~/.ssh/config

ln -snf  ~/dotfiles/git/.gitconfig ~/.gitconfig

if [ `uname` = "Darwin" ]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python3 cmake
    brew install vim --with-python --with-ruby --with-perl
    brew install macvim --env-std --override-system-vim
    sudo easy_install pip
fi


if [ `uname -o` = "GNU/Linux" ]
then
    sudo yum install -y cmake python-devel epel-release zsh git python-pip yum-utils  
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

sudo pip install virtualenvwrapper
# Install fonts pretty good
cd ~/dotfiles/fonts && bash install.sh
vim +PluginInstall +qall

#Fixing youcompleteme plugin
cd .vim/bundle/YouCompleteMe/
./install.py

chsh -s /bin/zsh
