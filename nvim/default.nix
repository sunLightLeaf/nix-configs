{ config, pkgs, inputs, ... }:

{
	nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          lazydev = prev.vimUtils.buildVimPlugin {
            name = "lazydev";
            src = inputs.lazydev-nvim;
          };
        };
      })
    ];
  };


  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    # aliases
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # config with default stuff
    extraLuaConfig = ''${builtins.readFile ./options.lua}'';

    extraPackages = with pkgs; [
      # clipboard
      xclip

			# grep for telescope
			ripgrep

			lua-language-server
			nil
    ];

		plugins = with pkgs.vimPlugins; [
			comment-nvim

			# autopairs
			{
				plugin = nvim-autopairs;
				config = toLuaFile ./plugins/autopairs.lua;
			}

			# colorscheme
			{
				plugin = gruvbox-nvim;
				config = ''
					colorscheme gruvbox
					set background=light
				'';
			}
			
			# lsp
			{
				plugin = pkgs.vimUtils.buildVimPlugin {
            name = "lazydev";
            src = inputs.lazydev-nvim;
          };
				config = "";
			}
			{
				plugin = nvim-lspconfig;
				config = toLuaFile ./plugins/lsp.lua;
			}

			# telescope
			telescope-fzf-native-nvim
			{
				plugin = telescope-nvim;
				config = toLuaFile ./plugins/telescope.lua;
			}

			# cmp
			cmp-nvim-lsp
			{
				plugin = nvim-cmp;
				config = toLuaFile ./plugins/cmp.lua;
			}

			# treesitter
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-yuck
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
					p.tree-sitter-rust
        ]));
        config = toLuaFile ./plugins/treesitter.lua;
      }
    ];
  };
}
