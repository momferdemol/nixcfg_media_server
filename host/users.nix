{ config, pkgs, ... }:

{
    users.users.setup = {
        isNormalUser = true;
        description = "setup";
        extraGroups = [
            "networkmanager"
            "wheel"
            "video"
            "render"
            "jellyfin"
        ];
    };

    users.users.magnus = {
        isNormalUser = true;
        initialPassword = "magnuswho";
        extraGroups = [ "networkmanager" "wheel" ];
    };
}