# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./common.nix
      ./i3.nix
      ./packages.nix
      ./sound.nix
#      <nixpkgs/nixos/modules/profiles/base.nix>
    ];

#use grub
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader = {
    efi = { 
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "radiant"; # Define your hostname.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.interfaces.en1u1u3u3.useDHCP = true;
  networking.networkmanager.enable = true;
  

  location.latitude = 52.1413516;
  location.longitude = 4.395683;
  services.redshift = {
    enable = true;
    brightness = {
      day = "0.75";
      night = "0.5";
    };
    temperature = {
      day = 5500;
      night = 3700;
    };
  };
  





  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  programs.nm-applet.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}


