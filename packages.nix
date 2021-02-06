{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
        wget
        vim
        ranger
        spotify
        discord
        meld
        git
        gcc
        gdb
        gcc-arm-embedded
        terminator
        htop
        clipmenu
        python3
        networkmanagerapplet
        nerdfonts
        lxqt.pavucontrol-qt
        firefox
        vscode
        sublime3
        zsh
        slack
        lsof
        fzf
        zathura
        usbutils
        chromium
        youtube-dl
        gparted

        networkmanager-fortisslvpn
        openfortivpn

    ];
}