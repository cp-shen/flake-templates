{
  outputs = { self }: {
    templates = rec {
      scala = { path = ./template; };
      default = scala;
    };
  };
}
