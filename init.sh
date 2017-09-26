#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

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

