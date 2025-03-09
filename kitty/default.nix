{ config, pkgs, ... }:

{
  programs.kitty = 
  {
    enable = true;
		settings = {
			###
			### misc
			###
			confirm_os_window_close = 0;
			enable_audio_bell 			= false;

			###
			### font
			###
			font_family 			= "JetBrains Mono";
			font_size 				= 13;
			disable_ligatures = "cursor";

			###
			### backround
			###
			background_opacity = "0.5";
		};
		keybindings = {
				###
				### scrolling
				###
				"alt+k" 			= "scroll_line_up";
				"cmd+k" 			= "scroll_line_up";
				"alt+j" 			= "scroll_line_down";
				"cmd+j" 			= "scroll_line_down";
				"alt+u" 			= "scroll_page_up";
				"cmd+u" 			= "scroll_page_up";
				"alt+d" 			= "scroll_page_down";
				"cmd+d" 			= "scroll_page_down";
				"alt+shift+g" = "scroll_end";
				"cmd+shift+g" = "scroll_end";
				###
				### zoom
				###
				"alt+shift+k"						= "change_font_size all +1.0"; 	#zoom in
				"cmd+shift+k"						= "change_font_size all +1.0";
				"alt+shift+j" 					= "change_font_size all -1.0"; 	#zoom out
				"cmd+shift+j" 					= "change_font_size all -1.0";
				"alt+shift+equal" 			= "change_font_size all 0"; 		#reset zoom
				"cmd+shift+equal" 			= "change_font_size all 0";
			};
  };
}
