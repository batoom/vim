#/bin/bash

CURL_DIR=$(cd "$(dirname "$0")";pwd)

echo "Install Vim......"

sudo apt-get install vim vim-gtk gtk2-engines-pixbuf exuberant-ctags cscope -y 

ln -sf $CURL_DIR ~/.vim
ln -sf $CURL_DIR/vimrc ~/.vimrc
