{
  description = "Flake for GitHub Pages (Jekyll) development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      # Ruby + Bundler + GitHub Pages gems
      rubyEnv = pkgs.bundlerEnv {
        name = "github-pages-env";
        ruby = pkgs.ruby_3_3; # use whichever Ruby version you prefer
        gemdir = ./.; # use your local Gemfile and Gemfile.lock
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "jekyll-dev";

        buildInputs = [
          rubyEnv
          pkgs.git
          pkgs.nodejs # optional, for any JS-based plugins or tooling
        ];

        shellHook = ''
          echo "🚀 GitHub Pages dev shell ready."
          echo "Run: bundle exec jekyll serve --livereload"
        '';
      };

      # Define nix run
      apps.${system}.default = {
        type = "app";
        program = "${rubyEnv}/bin/jekyll serve --livereload";
      };
    };
}
