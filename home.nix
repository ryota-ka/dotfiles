{ config, lib, pkgs, ... }:

let
  diffHighlight = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight";
in

{
  home.activation =
    let
      exec = cmd: lib.hm.dag.entryAfter [ "writeBoundary" ] cmd;
      link = src: dest: exec ''
        $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ${builtins.dirOf dest}
        $DRY_RUN_CMD ln -fs $VERBOSE_ARG ${src} ${dest}
      '';
      mkdirp = dir: exec ''
        $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ${dir}
      '';
    in
    {
      cocPackageJSON = link ./.vim/coc/package.json "${config.xdg.configHome}/coc/extensions/package.json";
      cocSettingsJSON = link ./.vim/coc/settings.json "${config.xdg.configHome}/nvim/coc-settings.json";
      karabinerJSON = link ./karabiner.json "${config.xdg.configHome}/karabiner/karabiner.json";
      neovimBackupDir = mkdirp "${config.xdg.dataHome}/nvim/backup";
      neovimUndoDir = mkdirp "${config.xdg.dataHome}/nvim/undo";
    };
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_US.UTF-8";
  home.packages = [
    pkgs.jetbrains-mono
    pkgs.niv
    pkgs.yarn
  ];
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.stateVersion = "22.05";
  home.username = builtins.getEnv "USER";

  programs.direnv = {
    enable = true;

    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;

    defaultOptions = [
      "--bind=ctrl-k:kill-line"
      "--bind=ctrl-space:toggle"
      "--reverse"
    ];
  };

  programs.gh = {
    enable = true;
  };

  programs.git = {
    enable = true;

    aliases = {
      br = "branch";
      cm = "commit -m";
      cma = "commit --amend";
      co = "checkout";
      dfc = "diff --cached";
      lg = "log --oneline --graph --decorate";
      st = "status";
    };
    extraConfig = {
      color = {
        ui = "auto";
      };
      core = {
        editor = "${pkgs.neovim}/bin/nvim";
        pager = "${diffHighlight} | less -R";
      };
      diff = {
        compactionHeuristic = true;
      };
      init = {
        defaultBranch = "master";
      };
      interactive = {
        diffFilter = "${diffHighlight}";
      };
      merge = {
        conflictStyle = "diff3";
        ff = false;
      };
      pull = {
        ff = "only";
      };
      push = {
        default = "current";
      };
      rebase = {
        autosquash = true;
        autostash = true;
      };
      rerere = {
        enabled = true;
      };
    };
    ignores = [
      "*~"
      "*.swp"
      ".DS_Store"
      ".direnv"
    ];
    signing = {
      key = "B3A90912D6C9D2AE";
    };
    userName = "Ryota Kameoka";
    userEmail = "ok@ryota-ka.me";
  };

  programs.home-manager = {
    enable = true;
  };

  programs.neovim = {
    enable = true;

    extraConfig = ''
      set runtimepath+=${./.vim}
      source ${pkgs.vimPlugins.vim-plug}/plug.vim
      source ${./.vimrc}
    '';
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };

  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    escapeTime = 1;
    extraConfig = ''
      source ${./.tmux.conf}
    '';
    historyLimit = 5000;
    keyMode = "vi";
    newSession = true;
    prefix = "C-j";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
  };

  programs.zsh = {
    enable = true;

    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    enableSyntaxHighlighting = true;
    envExtra = ''
      . ~/.nix-profile/etc/profile.d/nix.sh
    '';
    history = {
      extended = true;
      path = "${config.xdg.dataHome}/zsh/.zsh_history";
      save = 1000000;
      size = 1000000;
    };
    loginExtra = ''
      FPATH=${./.zsh/functions}:$FPATH

      export FPATH

      . ${./.zsh/completion.zsh}
      . ${./.zsh/functions.zsh}
      . ${./.zsh/history.zsh}
      . ${./.zsh/hooks.zsh}
      . ${./.zsh/ls.zsh}
      . ${./.zsh/options.zsh}
      . ${./.zsh/prompt.zsh}
      . ${./.zsh/words.zsh}
      . ${./.zsh/zmv.zsh}
    '';
    shellAliases = {
      cp = "cp -i";
      grep = "grep --colour=auto";
      la = "ls -A";
      ll = "ls -lh";
      mv = "mv -i";
      p = "popd";
      vim = "nvim";
    };
  };
}
