FILES := .gitconfig .gitconfig .tmux.conf .vim .vimrc .zsh .zshenv

all:

clean:
	@echo 'Removing all dotfiles in home directory'
	@$(foreach f, $(FILES), rm -fv $(HOME)/$(f);)
	@rm -fv ~/.config/nvim/init.vim

install: install-deps update link

install-deps:
	@echo 'Installing Python 3 for neovim...'
	@brew install python3
	@pip install --upgrade neovim
	@echo 'Installing reattach-to-user-namespace for tmux...'

link:
	@echo 'Linking dotfiles...'
	@$(foreach f, $(FILES), ln -fnsv $(abspath $(f)) $(HOME)/$(f);)
	@mkdir -p ~/.config/nvim
	@ln -fnsv $(abspath .vimrc) ~/.config/nvim/init.vim

update:
	@git pull origin master --quiet
	@git submodule update --init --quiet
	@git submodule foreach --quiet git pull origin master --quiet