all: build

build: home.nix
	home-manager --flake . build --impure

switch: build
	./result/activate
