{ config, pkgs, ... }:

{

    users.groups.mediashare = {
        name = "mediashare";
        members = [ "magnus" "jellyfin" ];
    };

    fileSystems."/mnt/mediashare" = {
        device = "//192.168.10.25/video";
        fsType = "cifs";
        options =
            [
                "credentials=/var/secrets/smbcred"
                "uid=1000"
                "gid=${toString config.users.groups.mediashare.gid}"
            ]
            ++ [
            "noauto"
            "x-systemd.automount"
            "x-systemd.idle-timeout=300"
            "x-systemd.device-timeout=5s"
            "x-systemd.mount-timeout=5s"
            ];
    };
}