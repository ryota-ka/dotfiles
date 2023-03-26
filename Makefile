all: build

build: home.base.nix
	home-manager -f ./home.base.nix build

switch: build
	./result/activate
