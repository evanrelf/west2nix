let
  pkgs = import <nixpkgs> { };

  west2nix = import ./default.nix { inherit pkgs; };

  zephyr =
    pkgs.fetchFromGitHub {
      owner = "zmkfirmware";
      repo = "zephyr";
      rev = "f2108f1646b964adffb9c7ed74641c828fef2a44";
      hash = "sha256-jEy+4OdBieu1HnSFpd/aJoFBDI1cTwiyqaXuNesHg4w=";
    };

in
west2nix "${zephyr}/west.yml"
