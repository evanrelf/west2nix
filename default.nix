{ pkgs ? import <nixpkgs> { } }:

westYml:

let
  yaml2json = yaml:
    let
      yamlFile =
        if builtins.isPath yaml || builtins.pathExists yaml then
          yaml
        else if builtins.pathExists (./. + "/${yaml}") then
          ./. + "/${yaml}"
        else
          builtins.toFile "west2nix-yaml2json-input.yaml" yaml;
    in
    builtins.readFile (pkgs.runCommand "west2nix-yaml2json-output.json" { } ''
      ${pkgs.yj}/bin/yj -yj < ${yamlFile} > $out
    '');

  manifest =
    (builtins.fromJSON (yaml2json westYml)).manifest;

  resolveUrl = project:
    if project ? url then
      assert !(project ? remote) && !(project ? repo-path); project.url
    else
      let
        remotes =
          pkgs.lib.listToAttrs
            (builtins.map
              (value: { inherit (value) name; inherit value; })
              manifest.remotes);

        url-base =
          if project ? remote then
            remotes.${project.remote}.url-base
          else
            remotes.${manifest.defaults.remote}.url-base;
      in
      if project ? repo-path then
        "${url-base}/${project.repo-path}.git"
      else
        "${url-base}/${project.name}.git";

  fetchProject = project:
    let
      src = pkgs.fetchgit
        ({
          url = resolveUrl project;
          hash = "";
        } // pkgs.lib.optionalAttrs (project ? revision) {
          rev = project.revision;
        });
    in
    pkgs.runCommand "west2nix-fetch-project-${project.name}" { } ''
      dest="$out/${project.path or project.name}"
      mkdir -p "$(dirname "$dest")"
      ln -s ${src} "$dest"
    '';

  workspace =
    pkgs.symlinkJoin {
      name = "west2nix-workspace";
      paths = builtins.map fetchProject manifest.projects;
    };

in
workspace
