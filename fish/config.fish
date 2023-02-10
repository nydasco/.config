if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    # Commands to run at login session can go here
end

starship init fish | source
zoxide init fish | source
set fish_greeting "Welcome back Andy. What do you want to do today?"
