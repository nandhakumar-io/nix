{ config, pkgs, ... }: {
    
networking.hostName = "kenpachi";

 networking.networkmanager.enable = true;
 networking.networkmanager.dns = "none";

 networking.nameservers = [
    "172.17.1.172"
    "1.1.1.1"
 ];

 networking.firewall = {
     enable = true;

     allowedTCPPorts = [ 22 80 443 514 4000];

     allowedUDPPorts = [ 22 41641 35469 514 4000 51283];

     trustedInterfaces = [ "wg0" ];

 };
    security.wrappers.ubridge = {
  owner = "root";
  group = "root";
  capabilities = "cap_net_admin,cap_net_raw+eip";
  source = "${pkgs.ubridge}/bin/ubridge";
};
}
