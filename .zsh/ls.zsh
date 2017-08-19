case ${OSTYPE} in
  darwin*) # configurations for OSX
    export CLICOLOR=1
    # export LSCOLORS=Exfxcxdxbxegedabagacad
    alias ls='ls -G -F'
    ;;
  linux*) # configurations for linux
    ;;
esac
