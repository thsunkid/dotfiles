# Install oh-my-zsh 
sh ~/.dotfiles/zsh/oh-my-zsh.sh &&

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&

# Setup vim config.
cp ~/.dotfiles/zsh/.zshrc ~/ &&
cp -r ~/.dotfiles/vim/.vim ~/ &&
cp ~/.dotfiles/vim/.vimrc ~/ &&

#set zsh as default shell
sudo chsh -s $(which zsh) &&
echo "zsh" >> .bashrc &&
zsh
