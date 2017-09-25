#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo ""
echo "› Dependencies:"

echo "  › Update Software:"
sudo softwareupdate -i -a

echo "  › Check & Install xcode:"

# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" -v;
else
  echo "Xcode CLI tools OK"
fi

if ! command -v brew > /dev/null 2>&1; then
	echo "  › Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "  › Homebrew already installed"
fi

