# ls {{{
alias ll='ls -l'
alias la='ls -Al'
# }}}
# git {{{
alias ga="git add"
alias gc="git commit"
alias gdiff="git diff"
alias gwdiff="git diff --word-diff"
alias glg="git lg"
alias gst="git status"
# }}}
# vagrant {{{
alias vst="vagrant status"
alias vup="vagrant up"
alias vssh="TERM=screen vagrant ssh"
# }}}
# console/editor {{{
alias diff="diff -u"
alias tmux="tmux -2" # Set tmux to use 256 colour
alias vin="nvim"
# }}}
# SSH {{{
# Set TERM for remote connections
alias ssh="TERM=screen ssh"
# }}}
# Salt {{{
alias salt-ssh="salt-ssh -c ~/salt-ssh"
# }}}
# mounts {{{
alias mountedge="sudo mount /dev/sdb /media/usb0"
# }}}

# vim:foldmethod=marker:ft=sh
