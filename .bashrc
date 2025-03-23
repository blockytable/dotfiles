#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias l='ls -a'
alias ll='ls -al'

alias ggl='lynx -accept-all-cookies google.com'

# Created by `pipx` on 2025-03-08 20:47:47
export PATH="$PATH:/home/hosni/.local/bin"

eval "$(register-python-argcomplete pipx)"

eval "$(starship init bash)"

eval "$(ssh-agent -s)" > /dev/null 2>&1

ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

gcm() {
    git commit -m "$*"
}
alias p='git push'
alias a='git add .'
