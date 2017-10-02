#!/usr/bin/env sh

set +e

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "› Dependencies:"

echo "  › Update Software:"
sudo softwareupdate -i -a

if ! command -v brew > /dev/null 2>&1; then
	echo "  › Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "  › Homebrew already installed"
fi

