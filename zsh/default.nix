{ config, pkgs, ... }:

{
  programs.zsh = 
  {
    enable = true;
		initExtra = ''${builtins.readFile ./zshrc}'';
  };
}
