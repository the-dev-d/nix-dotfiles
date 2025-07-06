{ config, lib, pkgs, modulesPath, ... }:

{

	environment.systemPackages = with pkgs; [
		gnomeExtensions.blur-my-shell
		gnomeExtensions.dash-to-dock
		gnomeExtensions.clipboard-history
		gnomeExtensions.compiz-alike-magic-lamp-effect
		gnomeExtensions.tiling-shell
		gnomeExtensions.quick-settings-tweaker
	];

    programs.kdeconnect = {
        enable = true;
        package = pkgs.gnomeExtensions.gsconnect;
    };

    services.xserver = {
  	  enable = true;
  	  displayManager.gdm.enable = true;
  	  desktopManager.gnome.enable = true;
    };
 
}
