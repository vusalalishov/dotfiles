let 
	pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/35fae2e1594808062fd9ee8f5ca2ecba42e93769.tar.gz") {
		pkgs{}.mkShell {
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
	}
