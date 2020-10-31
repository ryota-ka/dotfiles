export LANG=en_US.UTF-8
export ZDOTDIR=$HOME/.zsh

if [ -f $HOME/.creds ]; then
  . $HOME/.creds
fi

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi
