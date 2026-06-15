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
