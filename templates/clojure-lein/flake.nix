{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        jdkToUse = pkgs.jdk17;
        cljToUse = pkgs.clojure.override { jdk = jdkToUse; };

        cljDeps = with pkgs; [
          jdkToUse
          cljToUse
          (clojure-lsp.override { clojure = cljToUse; })
          (leiningen.override { jdk = jdkToUse; })
        ];
        shellHook = ''
          export JAVA_HOME="${jdkToUse.home}";
        '';
      in rec {
        devShells.clj = pkgs.mkShell {
          inherit shellHook;
          packages = cljDeps;
        };
        devShells.default = devShells.clj;
      });
}
