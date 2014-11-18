rm -rf  ~/.vim 
rm -f ~/.vimrc
rm -rf /tmp/dotvim

git clone https://github.com/RushPu/dotvim /tmp/dotvim
cp -rf /tmp/dotvim/vim ~/.vim
cp -f /tmp/dotvim/.vimrc ~/.vimrc
cp -f /tmp/dotvim/fonts/* ~/.local/share/fonts
