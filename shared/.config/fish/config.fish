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
