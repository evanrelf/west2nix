{ pkgs ? import <nixpkgs> { } }:

westYaml:

let
  yaml2json = yamlString:
    builtins.readFile (pkgs.runCommand "yaml2json" { } ''
      ${pkgs.yj}/bin/yj -yj < ${builtins.toFile "some.yaml" yamlString} > $out
    '');

  westNix =
    builtins.fromJSON (yaml2json (builtins.readFile westYaml));

in
# TODO
westNix
