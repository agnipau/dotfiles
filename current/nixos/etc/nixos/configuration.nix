# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "agnipau-nixos";
  networking.wireless.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp42s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    autorun = true;
    # xrandrHeads = [
    #   "HDMI-1"
    #   {
    #     "monitorConfig" = "Option \"Ignore\" \"true\"";
    #     "output" = "eDP-1";
    #   }
    # ];
    autoRepeatDelay = 200;
    autoRepeatInterval = 40;
    layout = "it";
    xkbModel = "pc105";
    xkbVariant = "us";
    xkbOptions = "caps:ctrl_modifier";
    displayManager.defaultSession = "none+i3";
    displayManager.lightdm.enable = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "agnipau";
    windowManager.i3.enable = true;
    desktopManager.xterm.enable = false;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = false;
    videoDrivers = [ "nvidia" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.agnipau = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  users.extraUsers.root.shell = pkgs.zsh;

  # Sorry R. M. Stallman.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    spotify
    neovim
    rustup
    tdesktop
    ripgrep
    fd
    i3
    tldr
    ffmpeg
    obs-studio
    xclip
    xsel
    dash
    firefox
    binutils.bintools
    imagemagick
    fzf
    dunst
    gimp
    mypaint
    starship
    ccls
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    bat
    efibootmgr
    jq
    exfat-utils
    ntfs3g
    lxappearance
    arc-theme
    arc-icon-theme
    physlock
    playerctl
    qbittorrent
    rsync
    pv
    sxiv
    zathura
    tokei
    xdo
    xdotool
    youtube-dl
    emacs
    entr
    diskus
    pastel
    pcmanfm
    vlc
    shellcheck
    pandoc
    zip
    pkgconfig
    python39
    hyperfine
    file
    dos2unix
    bc
    openssl
    openssl.dev
    libnotify
    pavucontrol
    alacritty
    trash-cli
    git
    gcc
    clang
    stow
    tmux
    picom
    rofi
    exa
    p7zip
    flameshot
    cmake
    gnumake
    libtool
    nodejs_latest
  ];
  environment.variables.OPENSSL_DIR = "${pkgs.openssl.dev}";
  environment.variables.OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
  environment.variables.ZSH_AUTOSUGGESTIONS_PATH = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
  environment.variables.ZSH_SYNTAX_HIGHLIGHTING_PATH = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}

