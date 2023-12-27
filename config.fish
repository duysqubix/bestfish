

# Check if not running interactively                                                                                                                                                                                                                                                                                                                                                 
if status --is-interactive
    # Check if commands exist before sourcing or aliasing                                                                                                                                                                                                                                                                                                                            
    if type -q bat
        alias cat='bat'
    end
    if type -q pyenv
        pyenv init - | source
    end

    # Create directories if they don't exist                                                                                                                                                                                                                                                                                                                                         
    mkdir -p "$HOME/.local/bin" "$HOME/.cargo/"

    # Set environment variables                                                                                                                                                                                                                                                                                                                                                      
    set -x PATH "$HOME/.local/bin" "$HOME/go/bin" $PATH /usr/local/go/bin "$HOME/.yarn/bin" "$HOME/.config/yarn/global/node_modules/.bin" $PATH
    set -x EDITOR nvim
    set -x GPG_TTY (tty)
    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH "$PYENV_ROOT/bin" $PATH

    # Source files and scripts if they exist                                                                                                                                                                                                                                                                                                                                         
    if test -f "$HOME/.localenv"
        source $HOME/.localenv
    end
    if test -f "$HOME/.cargo/env"
        set -x PATH "$HOME/.cargo/bin" $PATH
    end

    # Set aliases                                                                                                                                                                                                                                                                                                                                                                    
    alias dc='docker-compose'
    alias pipenv='virtualenv --python=python3 .venv'
    alias cat="bat"

    if type -q exa
        alias ls="exa"
    end

    # Add user's private bin to PATH if it exists                                                                                                                                                                                                                                                                                                                                    
    if test -d "$HOME/bin"
        set -x PATH "$HOME/bin" $PATH
    end
    if test -d "$HOME/.local/bin"
        set -x PATH "$HOME/.local/bin" $PATH
    end

    starship init fish | source
    starship preset nerd-font-symbols -o $HOME/.config/starship.toml

    curl "https://wttr.in/Seguin?mFn"
end
