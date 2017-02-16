# dotvim

## Requirements

- ctags
- vim must be compiled with perl & python (in order to use gundo)
  - ./configure --enable-perlinterp --enable-pythoninterp

### On OSX, use <a href="http://mxcl.github.com/homebrew/">homebrew</a>

```bash
brew install ctags cmake
brew install --build-from-source vim
brew install golang
brew install cabal-install
```

## Install

```bash
git clone git://github.com/raelga/dotvim.git .vim
cd .vim
ln -s ~/.vim/vimrc ~/.vimrc
```

### Install Vundle

```bash
bash ~/.vim/bundle/README.md
```

### Install other plugins using vundle

```bash
vim +':BundleInstall' +':q!' +':q!'
```


## Customization

```bash
~/.vim/vimrc.$USER
```

If your shell login is *foo*, create the file *~/.vim/vimrc.foo*.

