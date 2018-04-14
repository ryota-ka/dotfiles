FILES := .gitconfig .gitconfig .tmux.conf .vim .vimrc .zsh .zshenv

all:

clean:
	@echo 'Removing all dotfiles in home directory'
	@$(foreach f, $(FILES), rm -fv $(HOME)/$(f);)
	@rm -fv ~/.config/nvim/init.vim

install: install-deps install-vim-plug update link

install-deps:
	@echo 'Installing Python 3 for neovim...'
	@brew install python
	@pip install --upgrade neovim
	@echo 'Installing reattach-to-user-namespace for tmux...'
	@brew install reattach-to-user-namespace

install-vim-plug:
	@echo 'Installing vim-plug...'
	@curl -sS -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

link:
	@echo 'Linking dotfiles...'
	@$(foreach f, $(FILES), ln -fnsv $(abspath $(f)) $(HOME)/$(f);)
	@mkdir -p ~/.config/nvim
	@ln -fnsv $(abspath .vimrc) ~/.config/nvim/init.vim

update:
	@git pull origin master --quiet
