# west2nix

_Work in progress_

Import west manifest files into Nix

- west: https://github.com/zephyrproject-rtos/west
- west manifest files: https://docs.zephyrproject.org/latest/guides/west/manifest.html#manifest-files

## Usage

_This does not currently work!_

```nix
let
  pkgs = import <nixpkgs> { };

  # Acquire `west2nix`
  west2nix =
    import
      (pkgs.fetchFromGitHub {
        owner = "evanrelf";
        repo = "west2nix";
        rev = "<rev>";
        hash = "<hash>";
      })
      { inherit pkgs; };

  # Convert a west manifest file into Nix derivations which fetch the specified
  # projects and collapse them into a single source tree
  src = west2nix ./west.yml;

in
src
```
