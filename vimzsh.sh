# Install oh-my-zsh 
sh ~/.dotfiles/zsh/oh-my-zsh.sh &&

# Setup vim config + zsh's plugins.
cp ~/.dotfiles/zsh/.zshrc ~/ &&
cp -r ~/.dotfiles/vim/.vim ~/ &&
cp ~/.dotfiles/vim/.vimrc ~/ &&
cp /vinai/thunm15/thunm15/.zsh_history ~/ &&
cp -r /vinai/thunm15/thunm15/.oh-my-zsh/custom.zip ~/.oh-my-zsh/ &&
unzip ~/.oh-my-zsh/custom.zip -d ~/.oh-my-zsh/; rm ~/.oh-my-zsh/custom.zip &&
zsh
