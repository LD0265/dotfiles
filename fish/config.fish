if status is-interactive
# Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
set -x RUSTFLAGS "-C linker=gcc"
set -gx VISUAL code
set -gx EDITOR code
