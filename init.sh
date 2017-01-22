#!/bin/bash
echo "-= Installing System Dependencies =-"
brew install zsh tmux neovim/neovim/neovim python3 ag
brew tap caskroom/cask
brew cask install iterm2

echo "-= Installing Fonts =-"
brew tap caskroom/fonts
brew cask install font-fira-code

echo "-= Assigning Zsh as Default Shell =-"
chsh -s $(which zsh)

echo "-= Upgrading NeoVim with Python and Package Manager =-"
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "-= Setting Zsh as default shell =-"
chsh -s /usr/local/bin/zsh

echo "-= Removing any existing configs =-"
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

echo "-= Creating necessary directories =-"
mkdir -p ~/.config ~/.config/nvim

echo "-= Symlinking new configs =-"
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

echo "-= Log out and Log Back In to see changes =-"
