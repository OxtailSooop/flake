{ inputs, ... }:

let
  home-manager = inputs.home-manager;
in
{
  imports = [
    home-manager.nixosModules.home-manager
  ];
  
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}