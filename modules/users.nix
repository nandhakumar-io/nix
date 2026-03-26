{ config, pkkgs }: {
    users.users.kenpachi-zaraki = {
        isNormalUser =  true;
        description  ="kenpachi-Zaraki";
        extraGroups = [ "networkmanager" "wheel" "docker" "wireshark"];
        packages = with pkgs; [
            kdePackages.kate 

            # thunderbird
        ];
        shell  = pkgs.zsh
    }
    };

    users.users.nandha = {
        isNormalUser= true;
        description = "nandhakumar";
        extraGroups = [ "wheel" "docker" "wireshark" ];
        packages = with pkgs; [
        kdePackages.kate 
        ];
        shell  = pkgs.zsh
    };
}
