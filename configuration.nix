# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ./development.nix
    ];

	swapDevices = [
		{ device = "/swapfile"; }
	];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl."vm.swappiness" = 30;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.

  # Enable the GNOME Desktop Environment.
   services.xserver = {
  	  enable = true;
  	  displayManager.gdm.enable = true;
  	  desktopManager.gnome.enable = true;
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.devd = {
    isNormalUser = true;
    description = "Dhaivath Lal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  users.users.devd.shell = pkgs.zsh;

  programs.zsh = {
  	autosuggestions = {
  		enable = true;
  	};
  	syntaxHighlighting = {
  		enable = true;
  	};
  	shellAliases = {
  		ls = "eza -l --icons";
  		".." = "cd ..";
  		flakedir = "cd /home/devd/Flakes";
  	};
  };


  # Install firefox.
  programs.firefox.enable = true;
  programs.kdeconnect = {
  	enable = true;
  	package = pkgs.gnomeExtensions.gsconnect;
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	vscode
	vlc
	google-chrome
	obs-studio
	postman
	neofetch
  	windsurf
	termius
	warp-terminal
	gimp
	zsh
	gedit
	gnome-tweaks
	gnome-extension-manager
	cloudflare-warp
	unzip
	gnomeExtensions.blur-my-shell
	gnomeExtensions.dash-to-dock
	gnomeExtensions.clipboard-history
	gnomeExtensions.compiz-alike-magic-lamp-effect
	gnomeExtensions.tiling-shell
	zip
	nodejs_22
	jdk23
	nerd-fonts.fira-code
  	nerd-fonts.caskaydia-cove
	starship
	git
	mysql-workbench
	python313
	gparted
	eza
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.zsh.enable = true;

  programs.starship.enable = true;
  programs.starship.settings = {
  directory = {
      style = "fg:#e3e5e5 bg:#769ff0";
      format = "[ $path ]($style)";
      truncation_length = 3;
      truncation_symbol = "…/";
      substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
    };

    git_branch = {
      symbol = "";
      style = "bg:#394260";
      format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
    };

    git_status = {
      style = "bg:#394260";
      format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
    };

    nodejs = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };

    rust = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };

    golang = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };

    php = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "bg:#1d2230";
      format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
    };
  add_newline = true;
  command_timeout = 1300;
  scan_timeout = 50;
  format=''$user[░▒▓](#a3aed2)[ 󱄅 ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$git_branch$git_status[](fg:#394260 bg:#212736)$nodejs$rust$golang$php[](fg:#212736 bg:#1d2230)$time[ ](fg:#1d2230)
  $character'';
  character = {
      success_symbol = "[](bold green) ";
      error_symbol = "[✗](bold red) ";
    };
    
  };
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
