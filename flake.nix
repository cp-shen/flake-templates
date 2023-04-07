{
  outputs = { self }: {
    templates = rec {
      scala = {
        path = ./templates/scala;
        description = "a nix flake template for scala dev environment";
      };
    };
  };
}
