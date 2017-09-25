#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "› Dotfiles:"
echo "  › Clone dotfiles"
git clone git@github.com:nexeck/dotfiles.git ~/.dotfiles

echo "  › Install rcm"
brew tap thoughtbot/formulae
brew install rcm

echo "  › Install dotfiles"
env RCRC=$HOME/.dotfiles/rcrc rcup
