source ~/.config/fish/fish_env

switch (uname)
    case Linux
        source /usr/share/cachyos-fish-config/cachyos-config.fish
    case Darwin
    case '*'
end

function fish_greeting
    clear
end

# Git aliases
