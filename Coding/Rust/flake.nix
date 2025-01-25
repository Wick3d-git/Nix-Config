{
  description = "A devShell example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default =
          with pkgs;
          mkShell {
            buildInputs = [
              openssl
              pkg-config
              eza
              fd
              rust-bin.stable.latest.default
              zsh
              zsh-autosuggestions
              zsh-syntax-highlighting
            ];
            shellHook = ''
              # Create a temporary zsh config file
              export ZDOTDIR=$(mktemp -d)
              cat > "$ZDOTDIR/.zshrc" << "EOL"
              # Enable command substitution in prompts
              setopt PROMPT_SUBST

              # Function to get git branch
              function git_branch() {
                branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
                if [[ $branch == "" ]]; then
                  :  # Return nothing if not in a git repo
                else
                  echo "($branch)"
                fi
              }

              # Function to get Rust version
              function rust_version() {
                if command -v rustc >/dev/null 2>&1; then
                  version=$(rustc --version | cut -d' ' -f2)
                  echo "[🦀 $version]"
                fi
              }

              # Your custom prompt
              PROMPT='%F{blue}󱄅  %1~%f %F{green}$(rust_version)%f %F{yellow}$(git_branch)%f %F{magenta}(development)%f %F{white}|%  '

              # Your preferred environment variables
              export EDITOR='nvim'
              export TERMINAL='ghostty'
              export BROWSER='brave'
              export TERM='ghostty'

              # Enable features
              source ${zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
              source ${zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

              # Your aliases
              alias ls="eza --icons"
              alias find="fd"
              alias g="git"
              alias ga="git add"
              alias gc="git commit"
              alias gp="git push"
              alias gpl="git pull"
              alias gs="git status"
              EOL

              # Start zsh
              exec zsh
            '';
          };
      }
    );
}
