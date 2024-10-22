set fish_greeting "Let's fish codes!"

set -g theme_nerd_fonts yes
set -g theme_hostname always
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_color_scheme terminal-dark

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-macos.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        echo "Unsupported OS"
end

