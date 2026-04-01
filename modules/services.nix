{ config, pkgs, ... }:

{
  services = {
    openssh = {
      enable = true;
      ports = [ 2222 ];
      openFirewall = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    tailscale.enable = true;
    fprintd.enable = true;
    flatpak.enable = true;
    blueman.enable = true;
    nfs.server.enable = true;
    printing.enable = true;
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  # WireGuard
  networking.wireguard.enable = true;
  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.10.1.42/32" ];
    privateKeyFile = "/etc/wireguard/privatekey-wg0";

    peers = [
      {
        publicKey = "gXYY+irkG9x+7sZhjuF0od/fj0LdqqD9bKvZl5H1yC4=";
        allowedIPs = [
          "172.16.1.0/24"
          "172.17.1.0/24"
          "172.17.18.0/24"
          "192.168.50.0/24"
        ];
        endpoint = "10.10.15.193:51820";
      }
    ];
  };

    # Enable Bluetooth GUI 
    #services.blueman.enable = true;

  networking.firewall.allowedUDPPorts = [ 51820 ];

  # Docker & VM
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Audio (FIXED)
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Custom services
  systemd.services.rsyslog = {
    description = "Rsyslog daemon";
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.rsyslog}/bin/rsyslogd -n -f /etc/rsyslog.conf";
      Restart = "always";
    };
  };

  systemd.services.backup = {
    description = "Run backup daily";

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/home/kenpachi-zaraki/.config/scripts/backup.sh";
    };
  };

  systemd.timers.backup = {
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "12:00";
      Persistent = true;
    };
  };

  # Display
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
