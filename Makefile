all: build

build: home.nix
	home-manager -f ./home.nix build

switch: build
	./result/activate
