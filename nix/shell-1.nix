{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c77b5d162e62df170fec307e83f1812d94b.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.which
    pkgs.htop
    pkgs.zlib
  ];

  shellHook = ''
    echo Hello World!
  '';

  MY_ENVIRONMENT_VAR = "world";
  
}
