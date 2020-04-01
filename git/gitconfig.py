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

print("Generate github personal access token: https://github.com/settings/tokens/403274112")
name = prompt('Your Name: ')
email = prompt('Your Email: ')
github_username = prompt('GitHub Username: ')
token = prompt('GitHub API Token: ')

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




