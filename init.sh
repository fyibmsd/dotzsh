#!/usr/bin/env bash

case "$OSTYPE" in
  darwin*)  BRANCH=macos ;;
  linux*)   BRANCH=ubuntu ;;
esac

set -x

# clear all
rm -rf ~/.zsh ~/.oh-my-zsh ~/.zshrc
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# check os release
os=$(curl -sL https://raw.githubusercontent.com/fyibmsd/server-scripts/master/os.sh | bash -)
# install plugins
git clone --depth=1 -b $os https://github.com/fyibmsd/dotzsh ~/.zsh

cd ~/.zsh
# local config
touch .zsh_local
# submodule
git submodule init
git submodule update
echo "source ~/.zsh/.zsh_profile" >> ~/.zshrc
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc
sudo chsh -s /bin/zsh `whoami`
zsh

