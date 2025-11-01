{ config, pkgs, username, ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}";

    home.packages = with pkgs; [
        kdePackages.kate
        dig
        htop
    ];

    programs.plasma = {
        enable = true;
        powerdevil = {
            AC = {
                powerButtonAction = "nothing";
                autoSuspend.action = "nothing";
                turnOffDisplay.idleTimeout = "never";
                dimDisplay.enable = false;
            };
        };
        kscreenlocker = {
            autoLock = false;
            lockOnResume = false;
        };
    };

    programs.firefox.enable = true;

    programs.home-manager.enable = true;
    home.stateVersion = "25.05";  # channel version is not the same as state version.
}