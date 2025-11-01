{ config, pkgs, ... }:

{
    services = {

        xserver = {
            enable = true;
            xkb = {
                layout = "us";
                variant = "";
            };
        };

        displayManager = {
            sddm.enable = true;
            autoLogin = {
                enable = true;
                user = "magnus";
            };
        };

        desktopManager.plasma6.enable = true;
        pulseaudio.enable = false;
    
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };

        logind = {
            lidSwitch = "ignore";
            powerKey = "poweroff";
            suspendKey = "ignore";
            hibernateKey = "ignore";
        };

        jellyfin = {
            enable = true;
            openFirewall = true;  # localhost:8096
        };

        sunshine = {
            enable = true;
            autoStart = true;
            capSysAdmin = true;
            openFirewall = true;
        };

    };
}