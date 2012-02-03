#/bin/bash

echo "Install Vim......"

#sudo apt-get install vim vim-gtk gtk2-engines-pixbuf exuberant-ctags cscope -y 

CURL_DIR=$(cd "$(dirname "$0")";pwd)
ln -sf $CURL_DIR ~/.vim
ln -sf $CURL_DIR/vimrc ~/.vimrc

LINE=$(grep "stty -ixon" ~/.bashrc)
if [ -z "$LINE" ]; then
	echo "stty -ixon" >> ~/.bashrc
fi
