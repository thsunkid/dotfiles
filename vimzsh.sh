# Install oh-my-zsh 
sh ~/.dotfiles/zsh/oh-my-zsh.sh &&

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&

# Setup vim config.
cp ~/.dotfiles/zsh/.zshrc ~/ &&
cp -r ~/.dotfiles/vim/.vim ~/ &&
cp ~/.dotfiles/vim/.vimrc ~/ &&
vim +PlugInstall &&

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#set zsh as default shell
# sudo chsh -s $(which zsh) &&
echo "zsh" >> .bashrc &&
zsh
