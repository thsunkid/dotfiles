 #!/usr/bin/env sh
sudo apt-get install inotify-tools

SRC=$1
DES=$2
LOG=$2/log.txt
inotifywait -m $SRC -e create -e moved_to |
    while read dir action file; do
        echo "The file '$file' appeared in directory '$dir' via '$action'"
        file_mv=$dir$file 
        zip -r ~/$file.zip $file_mv 
        mv ~/$file.zip $DES
        echo "$(date):'$file_mv.zip' has been move to '$DES'" 
        echo "$(date):'$file_mv.zip' has been move to '$DES'" >> $LOG
    done
# Code was adapt from https://unix.stackexchange.com/questions/24952/script-to-monitor-folder-for-new-files#answer-24955
