if not test -f ~/.config/fish/fish_env
    echo "Creating fish_env template..."
    echo "# Add your environment variables here" > ~/.config/fish/fish_env
    echo "# set -gx MY_VAR value" >> ~/.config/fish/fish_env
end

source ~/.config/fish/fish_env

switch (uname)
    case Linux
        source /usr/share/cachyos-fish-config/cachyos-config.fish
    case Darwin
        /opt/homebrew/bin/brew shellenv | source
    case '*'
end

function fish_greeting
    clear
end

# Nvm plugin default node version
set --universal nvm_default_version v24

# Run starship prompt
starship init fish | source

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles
