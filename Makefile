FILES := .gitconfig .gitignore_global .tmux.conf .vim .vimrc .zsh .zshenv

all:

clean:
	@echo 'Removing all dotfiles in home directory'
	@$(foreach f, $(FILES), rm -fv $(HOME)/$(f);)
	@rm -fv ~/.config/nvim/init.vim

install: install-deps install-vim-plug update link postinstall

install-deps:
	@echo 'Installing Python 3 for neovim...'
	@brew install python
	@pip3 install --upgrade neovim
	@brew install neovim
	@echo 'Installing reattach-to-user-namespace for tmux...'
	@echo 'Installing Python 3 for neovim...'
	@brew install reattach-to-user-namespace
	@brew install node yarn
	@yarn global add neovim
	@brew install zsh-syntax-highlighting
	@brew install tmux
	@chmod -R go-w /usr/local/share

install-vim-plug:
	@echo 'Installing vim-plug...'
	@curl -sS -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

link:
	@echo 'Linking dotfiles...'
	@$(foreach f, $(FILES), ln -fnsv $(abspath $(f)) $(HOME)/$(f);)
	@mkdir -p ~/.config/nvim
	@ln -fnsv $(abspath .vimrc) ~/.config/nvim/init.vim
	@mkdir -p ~/.config/karabiner
	@ln -fnsv $(abspath karabiner.json) ~/.config/karabiner/karabiner.json
	@mkdir -p ~/.vim/backup
	@mkdir -p ~/.vim/undo

postinstall:
	echo 'Open Neovim and run :PlugInstall'

update:
	@git pull origin master --quiet
	@if (brew outdated | grep python); then brew upgrade python; fi
	@pip3 install --upgrade neovim
