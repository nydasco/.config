function ls
    exa -T -L=1 --icons $argv
end

function cdf
    cd $(find . -type d -print | fzf)
end

function vimf
    nvim $(fzf)
end

function vim
    nvim $argv
end

function cat
    bat $argv
end

function git_log
    git log --all --decorate --oneline --graph
end

function pbcopy
    xsel --clipboard --input $argv
end

function pbpaste
    xsel --clipboard --output $argv
end

function shutdown
    sudo shutdown -P now
end

function battery
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
end

function fzf_t
    fzf_tmux --reverse --border --height 60%
end

function fzf_p
    fzf_tmux --reverse --border --height 60% --preview 'bat --style=numbers --color=always --line-range :500 {}'
end
