# Launch Ubuntu's package installation
python3.7 ubuntu/apt.py &&
# Launch Git config
python3.7 git/gitconfig.py &&
# Launch Vim & zsh's setup
sh vimzsh.sh &&
# Launch the project
sh project/cond_cap.sh #replace with your_project_sh_filename
