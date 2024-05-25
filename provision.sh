#!/bin/bash
# install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o homebrew.sh
/bin/bash homebrew.sh
rm homebrew.sh
# install ansible
brew install ansible
# provision
ansible-playbook playbook.yaml
