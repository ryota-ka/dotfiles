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
      karabinerJSON = link ./karabiner.json "${config.xdg.configHome}/karabiner/karabiner.json";
      neovimBackupDir = mkdirp "${config.xdg.dataHome}/nvim/backup";
      neovimUndoDir = mkdirp "${config.xdg.dataHome}/nvim/undo";
    };
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_US.UTF-8";
  home.packages = [
    pkgs.copilot-language-server
    pkgs.delta
    pkgs.fd
    pkgs.github-copilot-cli
    pkgs.jetbrains-mono
    pkgs.nil
    pkgs.nodePackages."@tailwindcss/language-server"
    pkgs.nodePackages.graphql-language-service-cli
    pkgs.ripgrep
    pkgs.terraform-ls
    pkgs.tree-sitter
    pkgs.typescript-language-server
    pkgs.vscode-langservers-extracted
    pkgs.yaml-language-server
  ];
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.stateVersion = "25.11";
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
    enableZshIntegration = false;
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
      rs = "reset";
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
      column = {
        ui = "auto";
      };
      commit = {
        verbose = true;
      };
      init = {
        defaultBranch = "master";
      };
      merge = {
        conflictStyle = "zdiff3";
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

    defaultEditor = true;
    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '

      vim.opt.termguicolors = true
      vim.opt.runtimepath:append('${./vim}')

      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
          }, true, {})
          vim.fn.getchar()
          os.exit(1)
        end
      end
      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup({
        dev = {
          path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
        },
        performance = {
          reset_packpath = false,
          rtp = {
            reset = false,
          },
        },
        install = {
          missing = false,
        },
        spec = {
          {
            import = 'plugins',
          },
        },
      })
    '';
    plugins = [
      {
        optional = false;
        plugin = pkgs.vimPlugins.lazy-nvim;
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
    syntaxHighlighting = {
      enable = true;
    };
  };
}
