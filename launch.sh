# Launch Ubuntu's package installation
python ubuntu/apt.py &&
# Launch Git config
python git/gitconfig.py &&
# Launch Vim & zsh's setup
sh vimzsh.sh &&
# Launch the project
bash pickaproj.sh