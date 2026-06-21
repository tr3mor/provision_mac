#!/bin/bash
# install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o homebrew.sh
/bin/bash homebrew.sh
rm homebrew.sh
# install ansible
brew install ansible
# install karabiner-elements (requires interactive sudo for .pkg installer)
brew install --cask karabiner-elements
# provision
ansible-playbook playbook.yaml
