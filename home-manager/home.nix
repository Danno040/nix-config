# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  home = {
    username = "mikef";
    homeDirectory = "/home/mikef";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.git = {
    enable = true;
    userName = "Mike F.";
    userEmail = "danno040@gmail.com";
    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        syntax-theme = "zenburn";
      };
    };
  };

  programs.gitui = {
    enable = true;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = [
      pkgs.vimPlugins.YouCompleteMe
      pkgs.vimPlugins.vim-sensible
    ];
    settings = {
      expandtab = true;
      shiftwidth = 2;
      copyindent = true;
    };
    extraConfig = ''
syntax on
autocmd FileType typescript hi link typescriptReserved Special
'';
  };

  programs.ripgrep.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    envExtra = ''
# Enable Ctrl-F and Ctrl-B to move forward and back
bindkey '^F' vi-forward-blank-word
bindkey '^B' vi-backward-blank-word
    '';
    plugins = [
      {
        name = "spaceship";
        file = "share/zsh/themes/spaceship.zsh-theme";
        src = pkgs.spaceship-prompt;
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "man" ];
      theme = "spaceship";
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.ghostty.enableZshIntegration = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
