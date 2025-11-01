
<pre>
  Title: Media (Desktop) Server
  Author: Momfer de Mol
  Status: Active
  Created: 01-11-2025
</pre>

# nixconf

First install NixOS on the device and make a copy of the `hardware-configuration.nix` file. Clone this repository to the `/etc/nixos/` directory and install the `.#akila` flake.

Create the `smbcred` in the `/var/secrets/` directory to establish NAS access.

Use the [Moonlight](https://moonlight-stream.org/) client to access the desktop from any device within the network.

## Commands

```sh
nixos-rebuild switch --flake .#akila --show-trace
```
