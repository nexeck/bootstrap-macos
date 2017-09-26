#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "› Init:"
curl -fsSL https://raw.githubusercontent.com/nexeck/bootstrap-macos/master/init.sh | sh

echo "› Dotfiles:"
curl -fsSL https://raw.githubusercontent.com/nexeck/bootstrap-macos/master/dotfiles.sh | sh

echo "› Defaults:"
curl -fsSL https://raw.githubusercontent.com/nexeck/bootstrap-macos/master/defaults.sh | sh
