{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            venvDir = ".venv";
            buildInputs = with pkgs; [
              zsh
            ];
            packages =
              with pkgs;
              [
                python314
                zsh-syntax-highlighting
                zsh-autosuggestions
                pdm
              ]
              ++ (with pkgs.python313Packages; [
                pip
                venvShellHook
              ]);
            shellHook = with pkgs; ''
              # Create a temporary zsh config file
              export ZDOTDIR=$(mktemp -d)
              cat > "$ZDOTDIR/.zshrc" << "EOL"
               if [ ! -d ".venv" ]; then
                echo "Creating Python virtual environment in .venv..."
                python3.14 -m venv .venv
              fi

              # Set the VIRTUAL_ENV variable to point to .venv
              export VIRTUAL_ENV="$PWD/.venv"
              export PATH="$VIRTUAL_ENV/bin:$PATH"

              # Activate the virtual environment
              source "$VIRTUAL_ENV/bin/activate"
              # Enable command substitution in prompts
              setopt PROMPT_SUBST
              source ${zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
              source ${zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

              # Function to get git branch
              function git_branch() {
                branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
                if [[ $branch == "" ]]; then
                  :  # Return nothing if not in a git repo
                else
                  echo "($branch)"
                fi
              }
              # Function to get Python version
              function python_version() {
                if command -v python3 >/dev/null 2>&1; then
                  version=$(python3 --version | cut -d' ' -f2)
                    echo "[🐍 $version]"
                    elif command -v python >/dev/null 2>&1; then
                    version=$(python --version | cut -d' ' -f2)
                    echo "[🐍 $version]"
                    fi
              }

              # Your custom prompt
              PROMPT='%F{blue}󱄅  %1~%f %F{green}$(python_version)%f %F{yellow}$(git_branch)%f %F{magenta}(development)%f %F{white}|%  '

              # Your preferred environment variables
              export EDITOR='nvim'
              export TERMINAL='ghostty'
              export BROWSER='brave'
              export TERM='ghostty'

              # Your aliases
              alias ls="eza --icons"
              alias find="fd"
              alias p="python"
              alias g="git"
              alias ga="git add"
              alias gc="git commit"
              alias gp="git push"
              alias gpl="git pull"
              alias gs="git status"
              EOL

              exec zsh
            '';
          };
        };
      }
    );
}
