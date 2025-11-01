{ config, pkgs, ... }:

{

    imports = [
        ./hardware-configuration.nix
        ./local.nix
        ./networking.nix
        ./services.nix
        ./users.nix
        ./fileshare.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_6_17;

    nix.settings.experimental-features = "nix-command flakes";

    powerManagement.enable = false;

    security.rtkit.enable = true;

    nixpkgs.config.allowUnfree = true;

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver
            libva-vdpau-driver
            intel-compute-runtime
            vpl-gpu-rt
        ];
    };

    environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
    systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";

    hardware.enableRedistributableFirmware = true;

    boot.kernelParams = ["i915.enable_guc=2"];

    users.users.jellyfin.extraGroups = [
        "video"
        "render"
    ];

    environment.systemPackages = with pkgs; [
        cifs-utils
        jellyfin-ffmpeg
        libva-utils
        intel-gpu-tools
    ];

    system.stateVersion = "25.05";  # channel version is not the same as state version.
}