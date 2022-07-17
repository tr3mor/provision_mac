install: install-oh-my-zsh install-homebrew install-ansible ansible-playbook
install-oh-my-zsh:
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install-oh-my-zsh.sh
	sh install-oh-my-zsh.sh
	rm install-oh-my-zsh.sh
install-homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o homebrew.sh
	/bin/bash homebrew.sh
	rm homebrew.sh
install-ansible:
	brew install ansible
provision:
	ansible-playbook playbook.yaml
lint:
	yamllint .