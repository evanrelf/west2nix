{ fetchgit
, lib
, runCommand
, symlinkJoin
, yj
}:

westYml:

# TODO: When `hashes` is empty, instruct the user to run a prepared
# `nix-prefetch-git` script and copy the output into the attribute set. Or
# something like that. Basically just automate it because doing it manually is
# so painful.
{ hashes ? { }
}:

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
    builtins.readFile (runCommand "west2nix-yaml2json-output.json" { } ''
      ${yj}/bin/yj -yj < ${yamlFile} > $out
    '');

  manifest =
    (builtins.fromJSON (yaml2json westYml)).manifest;

  resolveUrl = project:
    if project ? url then
      assert !(project ? remote) && !(project ? repo-path); project.url
    else
      let
        remotes =
          lib.listToAttrs
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

  # TODO: Fetch imported projects recursively
  fetchProject = project:
    let
      src =
        (fetchgit
          ({
            url = resolveUrl project;
            sha256 = hashes.${project.name} or lib.fakeSha256;
          } // lib.optionalAttrs (project ? revision) {
            rev = project.revision;
          })
        ).overrideAttrs (_: {
          name = "west2nix-fetchgit-${project.name}";
        });
    in
    runCommand "west2nix-fetch-project-${project.name}" { } ''
      dest="$out/${project.path or project.name}"
      mkdir -p "$(dirname "$dest")"
      ln -s ${src} "$dest"
    '';

  workspace =
    symlinkJoin {
      name = "west2nix-workspace";
      paths = builtins.map fetchProject manifest.projects;
    };

in
workspace
