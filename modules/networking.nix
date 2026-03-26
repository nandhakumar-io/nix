{ config, pkgs, ... }: {
    
networking.hostName = "kenpachi";

 networking.networkmanager.enable = true;
 networking.networkmanager.dns = "none";

 networking.nameservers = [
    "172.17.1.172"
    "1.1.1.1"
 ];

 networking.firewall = {
     enablle = true;

     allowedTCPPorts = [ 2222 80 443 514];

     allowedUDPPorts = [ 41641 35469 514];

     trustedInterfaces = [ "wg0" ];

 };
}
