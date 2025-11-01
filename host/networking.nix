{ config, pkgs, ... }:

{
    networking = {

        hostName = "akila";

        useDHCP = false;

        interfaces.eth0 = {
            ipv4.addresses = [
              {
                address = "192.168.10.12";
                prefixLength = 32;
              }
            ];
        };

        interfaces.eth1 = {
            ipv4.addresses = [
              {
                address = "192.168.10.13";
                prefixLength = 32;
              }
            ];
        };

        defaultGateway = {
            address = "192.168.10.1";
            interface = "eth0";
        };

        nameservers = [ "192.168.10.10" ];

        networkmanager = {
            enable = true;
        };

        firewall = {
            enable = true;
            allowedTCPPorts = [ 2049 ];
            allowedUDPPorts = [ 2049 ];
        };

        wireless = {
            enable = false;
        };

    };
}