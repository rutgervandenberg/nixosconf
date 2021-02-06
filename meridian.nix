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
    networking.hostName = "meridian"; 
    networking.networkmanager.enable = true;
    programs.nm-applet.enable = true;
}