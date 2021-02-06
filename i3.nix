  { config, pkgs, ... }:

{
  services.xserver = {
#    videoDrivers = [ "nvidia" ];
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false; 
      };
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
	networkmanager_dmenu
        i3lock
        i3blocks
	i3status
      ];
    };
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "xfce+i3";
  };
}