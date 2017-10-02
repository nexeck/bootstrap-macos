#!/usr/bin/env sh

set +e

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

echo "› Init:"
curl -fsSL https://raw.githubusercontent.com/nexeck/bootstrap-macos/master/init.sh | sh

echo "› Dotfiles:"
curl -fsSL https://raw.githubusercontent.com/nexeck/dotfiles/master/install.sh | sh

echo "› Defaults:"
curl -fsSL https://raw.githubusercontent.com/nexeck/bootstrap-macos/master/defaults.sh | sh
