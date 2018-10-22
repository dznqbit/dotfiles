# vim-files
Personal Vim Files

```
# Create backups for .vim and .vimrc
cp -r ~/.vim ~/.vim.bak
mv ~/.vimrc/ ~/.vimrc.bak

# Clone to .vim
git clone git@github.com:dznqbit/vim-files.git ~/.vim

# Symlink your .vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

# Install Plugins
vim +PluginInstall +qall
```
