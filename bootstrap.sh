# get oh my zsh
curl -L http://install.ohmyz.sh | sh

cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -snf ~/dotfiles/zsh/zshrc ~/.zshrc

ln -snf ~/dotfiles/vim ~/.vim
ln -snf ~/dotfiles/vimrc ~/.vimrc

ln -snf ~/Dropbox/git/ssh/config ~/.ssh/config

ln -snf  ~/dotfiles/git/.gitconfig ~/.gitconfig
