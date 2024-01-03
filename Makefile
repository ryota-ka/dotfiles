all: build

build: home.nix
	home-manager --flake . build --impure

switch: build
	./result/activate
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
