{
  description = "Minha build do st";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
	let
		system = "x86_64-linux";
	in
	{
		packages.${system}.st =
      nixpkgs.legacyPackages.x86_64-linux.st.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [ nixpkgs.legacyPackages.x86_64-linux.harfbuzz ];
				src = ./.;
      });
			

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.st;
  };
}
