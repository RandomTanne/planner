
{
  description = "Ruby on Rails development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          ruby
          bundler
          nodejs
          pkg-config
          libyaml
          zlib
          libffi
          openssl
          readline
          gnumake
        ];

        shellHook = ''
          export GEM_HOME="$PWD/.gem"
          export PATH="$GEM_HOME/bin:$PATH"

          echo "Ruby: $(ruby --version)"
          echo "Bundler: $(bundle --version)"
        '';
      };
    };
}
 
