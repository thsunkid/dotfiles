# Fast launch your Ubuntu machine with dotfiles.
This is a repo for quickly setup the remote/cloud Ubuntu machine, using the default `/usr/bin/python` and `/bin/sh`.  
This setup includes:
- Install basic/personal Ubuntu's packages
- Setup Git
- Setup Vim & Zsh (optional)
- Prepare your project

--- 
### Download this script
```
git clone https://github.com/thsunkid/dotfiles.git $HOME/.dotfiles
```

---
### Launch it 🚀
```
cd $HOME/.dotfiles; sh launch.sh
```
---
### Other features
**Notify new files in a specified folder & automatically move them to a permanent place.**
```
sh check_me.sh $SOURCE_FOLDER $PERMANENT_FOLDER # sh check_me.sh runs/ /home/thunm15/ 
``` 
See the log at `$PERMANENT_FOLDER\log.txt` 






