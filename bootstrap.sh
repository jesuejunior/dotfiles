# get oh my zsh
curl -L http://install.ohmyz.sh | sh

cd ~/dotfiles

git submodule init && git submodule update

cp ~/dotfiles/zsh/themes/jj.zsh-theme ~/.oh-my-zsh/themes/

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

ln -s ~/dotfiles/vim ~/.vim

ln -s ~/Dropbox/git/ssh/config ~/.ssh/config

ln -s  ~/dotfiles/git/.gitconfig ~/.gitconfig
