# get oh my zsh
curl -L http://install.ohmyz.sh | sh

cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vim/vimrc ~/.vimrc

ln -snf ~/Dropbox/git/ssh/config ~/.ssh/config

ln -snf  ~/dotfiles/git/.gitconfig ~/.gitconfig

if [ `uname` = "Darwin" ]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python3
    brew install vim --with-python --with-ruby --with-perl
    brew install macvim --env-std --override-system-vim
    sudo easy_install pip
fi

sudo pip install mkvirtualenvwrapper
vim +PluginInstall +qall

