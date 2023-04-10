{
  outputs = { self }: {
    templates = rec {
      scala = {
        path = ./templates/scala;
        description = "a nix flake template for scala dev environment";
      };
      haskell = {
        path = ./templates/haskell;
        description = "a nix flake template for haskell dev environment";
      };
      clojure-lein = {
        path = ./templates/clojure-lein;
        description = "a nix flake template for clojure dev environment";
      };
      clj = clojure-lein;
    };
  };
}
