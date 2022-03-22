{
  description = ''High level GObject-Introspection based GTK3/GTK4 bindings'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-gintro-v0_5_3.flake = false;
  inputs.src-gintro-v0_5_3.ref   = "refs/tags/v0.5.3";
  inputs.src-gintro-v0_5_3.owner = "stefansalewski";
  inputs.src-gintro-v0_5_3.repo  = "gintro";
  inputs.src-gintro-v0_5_3.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-gintro-v0_5_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-gintro-v0_5_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}