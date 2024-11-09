{
  config,
  pkgs,
  ...
}: {
  security.acme.acceptTerms = true;
  security.acme.defaults = {
    email = "acme@cavemansoftware.org";
  };
  networking.firewall.allowedTCPPorts = [80 22 443];
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    # commonHttpConfig = ''
    #   #real_ip_header CF-Connecting-IP;
    #   add_header 'Referrer-Policy' 'origin-when-cross-origin';
    #   add_header X-Frame-Options DENY;
    #   add_header X-Content-Type-Options nosniff;
    # '';
    virtualHosts."cavemansoftware.org" = {
      serverAliases = ["www.${config.networking.domain}"];
      root = "/var/www/html";
      serverName = "cavemansoftware.org";

      locations."/" = {
        root = "/var/www/html";
        index = "index.html";
      };
      locations."/contact" = {
        root = "/var/www/html";
        index = "contact.html";
      };
      enableACME = true; # auto certs
      forceSSL = true; # http bad
    };
  };
}
