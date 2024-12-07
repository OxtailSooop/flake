{
  inputs,
  ...
}:

{
  flake.nixosConfigurations = {
    cafe = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./cafe ];
    };
    wackbook = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./wackbook ];
    };
  };
}