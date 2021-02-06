{ config, pkgs, ... }:

{
    time.timeZone = "Europe/Amsterdam";
    nixpkgs.config.allowUnfree = true;

    # Configure keymap in X11
    services.xserver.layout = "us";
    services.xserver.xkbOptions = "eurosign:e";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.rutger = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };
    programs.zsh.ohMyZsh = {
        enable = true;
        plugins = [ "git" "python" "man" "colorize" "extract" "fzf"];
        theme="powerlevel9k/powerlevel9k";
    };
    environment.variables.EDITOR = "terminator";
    fonts.fonts = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

}