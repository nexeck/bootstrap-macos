#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "› Dotfiles:"
echo "  › Clone dotfiles"
if ! test -d ~/.dotfiles
then
  git clone git@github.com:nexeck/dotfiles.git ~/.dotfiles
else
  echo "  › Dotfiles exists"
fi

echo "  › Install rcm"
brew tap thoughtbot/formulae
brew install rcm

echo "  › Install dotfiles"
env RCRC=$HOME/.dotfiles/rcrc rcup

echo "› Brew bundle"
brew bundle --global

echo "› ZSH"
echo "  › Add ZSH to /etc/shells"
test -n $(command -v zsh) && ! grep -qF "$(command -v zsh)" /etc/shells && command -v zsh | sudo tee -a /etc/shells
echo "  › Switch default Shell to ZSH"
chsh -s "$(command -v zsh)"
