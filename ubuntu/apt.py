apts = [
        "byobu",
        "vim",
        "git",
        "zip",
        "htop",
        "ncdu",
        "tig",
        "tree",
        "make",
        "gcc",
        "curl",
        "zsh",
        "ufw",
        "ctags"
        ]

apt_gets = [
        "trash-cli"
]

import os
for apt in apts:
    os.system('sudo apt install -y %s' % apt)

for apt_get in apt_gets:
        os.system('sudo apt-get install -y %s' % apt_get)
