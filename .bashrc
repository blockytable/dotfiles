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

# SSH Agent Management
env=~/.ssh/agent.env

agent_load_env() { test -f "$env" && . "$env" >| /dev/null; }

agent_start() {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
}

agent_load_env

# Check if agent is running
if ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1; then
    agent_start
elif [ -n "$SSH_AUTH_SOCK" ] && ! ssh-add -l > /dev/null 2>&1; then
    # Agent is running but has no keys loaded
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

unset env

gcm() {
    git commit -m "$*"
}
alias p='git push'
alias a='git add .'
