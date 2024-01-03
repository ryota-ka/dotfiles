{ config, lib, pkgs, ... }:

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
      cocPackageJSON = link ./vim/coc/package.json "${config.xdg.configHome}/coc/extensions/package.json";
      cocSettingsJSON = link ./vim/coc/settings.json "${config.xdg.configHome}/nvim/coc-settings.json";
      karabinerJSON = link ./karabiner.json "${config.xdg.configHome}/karabiner/karabiner.json";
      neovimBackupDir = mkdirp "${config.xdg.dataHome}/nvim/backup";
      neovimUndoDir = mkdirp "${config.xdg.dataHome}/nvim/undo";
    };
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_US.UTF-8";
  home.packages = [
    pkgs.delta
    pkgs.jetbrains-mono
    (pkgs.nerdfonts.overrideAttrs { fonts = ["JetBrainsMono"]; })
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

  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        normal = {
          black = "#1b1d1e";
          red = "#f92672";
          green = "#a6e22e";
          yellow = "#fd971f";
          blue = "#66d9ef";
          magenta = "#ce27db";
          cyan = "#ae81ff";
          white = "#eeeeee";
        };
        primary = {
          background = "#1c1d1e";
          foreground = "#fafafa";
        };
      };
      cursor = {
        style = {
          blinking = "On";
        };
      };
      font = {
        size = 18;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "ExtraLight";
        };
        bold = {
          style = "Bold";
        };
        italic = {
          style = "ExtraLight Italic";
        };
        bold_italic = {
          style = "Bold Italic";
        };
      };
      window = {
        blur = true;
        decorations = "buttonless";
        opacity = 0.95;
        option_as_alt = "Both";
      };
    };
  };

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
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        navigate = true;
        side-by-side = true;
      };
    };
    extraConfig = {
      advice = {
        skippedCherryPicks = false;
      };
      color = {
        ui = "auto";
      };
      diff = {
        compactionHeuristic = true;
      };
      init = {
        defaultBranch = "master";
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
        stat = true;
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

    extraLuaConfig = ''
      vim.opt.runtimepath:append('${./vim}')
      require('plugins')
    '';
    plugins = [
      {
        optional = false;
        plugin = pkgs.vimPlugins.packer-nvim;
      }
    ];
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
    newSession = false;
    prefix = "C-j";
    shell = pkgs.lib.getExe pkgs.zsh;
    terminal = "screen-256color";
  };

  programs.zsh = {
    enable = true;

    completionInit = "autoload -U compinit && compinit -u";
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    enableSyntaxHighlighting = true;
    envExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels

      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    history = {
      extended = true;
      path = "${config.xdg.dataHome}/zsh/.zsh_history";
      save = 1000000;
      size = 1000000;
    };
    loginExtra = ''
      FPATH=${./zsh/functions}:$FPATH

      export FPATH

      . ${./zsh/completion.zsh}
      . ${./zsh/functions.zsh}
      . ${./zsh/history.zsh}
      . ${./zsh/hooks.zsh}
      . ${./zsh/ls.zsh}
      . ${./zsh/options.zsh}
      . ${./zsh/prompt.zsh}
      . ${./zsh/words.zsh}
      . ${./zsh/zmv.zsh}
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
