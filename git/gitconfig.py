gitconfig = """
[user]
	name = $name
	email = $email

[color]
	diff = auto
	status = auto
	branch = auto

[color "branch"]
    current = red reverse
    local = blue
    remote = green

[color "diff"]
    meta = yellow
    frag = magenta
    old = red bold
    new = green
    plain = white

[color "status"]
    added = yellow
    changed = green
    untracked = cyan

[core]
	excludesfile = $home/.gitexcludes
	editor = vim
	autocrlf = input

[apply]
	whitespace = nowarn

[format]
	pretty = %C(yellow)%h%Creset %s %C(red)(%an, %cr)%Creset

[github]
	user = $github_username
	token = $token

"""

from string import Template
from os import environ
import os
import sys

if sys.version_info > (3, 0):
    prompt = input
else:
    prompt = raw_input

# colorize text
class colors:
    """ ANSI color codes """
    INFO = '\033[0;37;42m'
    LINK = '\x1B[32;40m'
    END = "\033[0m"
    # cancel SGR codes if we don't write to a terminal
    if not __import__("sys").stdout.isatty():
        for _ in dir():
            if isinstance(_, str) and _[0] != "_":
                locals()[_] = ""
    else:
        # set Windows console in VT mode
        if __import__("platform").system() == "Windows":
            kernel32 = __import__("ctypes").windll.kernel32
            kernel32.SetConsoleMode(kernel32.GetStdHandle(-11), 7)
            del kernel32

print("Generate github personal access token @ " + colors.LINK + "https://github.com/settings/tokens/new" + colors.END)
name = prompt(colors.INFO + 'Your Name: '+colors.END +'\t')
email = prompt(colors.INFO + 'Your Email: ' + colors.END + '\t')
github_username = prompt(colors.INFO + 'GitHub Username: ' + colors.END + '\t')
token = prompt(colors.INFO + 'GitHub API Token: ' + colors.END + '\t')

d = {
	"name": name,
	"email": email,
	"home": environ['HOME'],
	"github_username": github_username,
	"token": token
}

gitconfig = Template(gitconfig).substitute(d)

with open('%s/.gitconfig' % environ['HOME'], 'w+') as f:
	f.write(gitconfig)




