# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
alias python=python3
alias pip=pip3

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# setup zsh highlight
source /Users/thesunkid/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# setup neovim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##### MACROS #####
# nvim as vi
alias vi='nvim'

# check weather
alias weather='curl wttr.in'


# git alias
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
alias gv='git commit -v'
alias gm='git merge --no-ff'
alias goops='git commit --amend --no-edit'

# Kubectl command
alias kc="kubectl"
alias kce='f() { kubectl exec -it "$1" -- /bin/sh; }; f'
alias kcgp="kubectl get pods"
alias kcdp="kubectl describe pod"


prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}


# Block site usage
blocksite() {
    local site="$1";
    echo "127.0.0.1" $site | sudo tee -a /etc/hosts > /dev/null
}

close_tabs_with_domain() {
    local browser="$1"
    local domain="$2"

    osascript -e "tell application \"$browser\"
        repeat with w in windows
            set tabList to (every tab of w whose URL contains \"$domain\")
            repeat with t in tabList
                close t
            end repeat
        end repeat
    end tell"
}


tmpaccess() {
    sudo sed -i "" "/$1/s/^/#/" /etc/hosts
    echo "\n========================================================\n\e[38;5;107mGod granted you the sin to access $1 in $2 seconds\n              Be mindful of the time. ⏳  \e[0m\n========================================================\n"
    (
        sleep $2; sudo sed -i "" "/$1/s/^#//" /etc/hosts;
        close_tabs_with_domain "Safari" $1;
        close_tabs_with_domain "Google Chrome" $1;
        close_tabs_with_domain "Brave Browser" $1;
        echo "\n\033[0;33mEnough fun. Go back to work 🏋️‍♂️"
    ) & disown;
}

# old habits :)
alias top="btop"
alias cat="bat"

# Alias aichat
alias gwern='aichat -m openai:gpt-4o -r gwern'
alias rewriteo="aichat -m openai:gpt-4o -r rewrite 'rewrite this without altering original words while correcting the grammar: ' "
alias format="aichat -m openai:gpt-4o -r gwern 'Reformat the following text extracted from pdf, dont rewrite: ' "
alias rewrite="aichat -r rewrite"
alias crewrite="aichat -m claude:claude-3-5-sonnet-20240620 -r rewrite"
alias gwernc='aichat -m openai:gpt-4o -r gwern -s'
alias cgwern='aichat -m claude:claude-3-5-sonnet-20240620 -r gwern'
alias cgwernc='aichat -m claude:claude-3-5-sonnet-20240620 -r gwern -s'
alias founder='aichat -r founder'
alias chatjob='aichat -r job'
alias cfe='aichat -m claude:claude-3-5-sonnet-20240620 -r fe -s'

alias fix="aichat -e 'fix this: ' "
# Alias pytest
alias pytest='pytest -s -vv --disable-warnings'
alias pytestn='pytest -s -vv --disable-warnings -n auto'

scan_screen() {

    local latest_file=$(find /Users/thesunkid/screencap -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -1 | cut -f2- -d" ")
    local question=$1
    
    echo "Scanning the screencap '$latest_file' ..."
    
    aichat -r gwern -m openai:gpt-4o -s t1 --file "$latest_file" -- "$question"
    
}

