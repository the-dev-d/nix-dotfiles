{ config, lib, pkgs, modulesPath, ... }:

{

	virtualisation.docker.enable = true;
	users.users.devd.extraGroups = [ "docker" ];

	environment.systemPackages = with pkgs; [
		docker
		windsurf
		nodejs_22
		jdk23
		python311
		minikube
	];

	services.nginx = {
	  enable = true;
	  user = "devd";
	  group = "users";
	  virtualHosts."localhost" = {
		  root = "/var/www";
		  locations."/" = {
		index = "index.html";
		  };
		};
	};
	networking.firewall.allowedTCPPorts = [ 80 4200 ];
 
}
