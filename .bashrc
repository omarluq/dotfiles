#
# ~/.bashrc
#
#
[[ $- == *i* ]] && source ./ble.sh/out/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $- == *i* ]]; then # in interactive session
  set -o vi
fi

# env vars
[ -r ~/.bashenv ] && . ~/.bashenv

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-06-15 21:04:03
export PATH="$PATH:/home/omarluq/.local/bin"

# rbenv
export RBENV_ROOT="/usr/local/rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

eval "$(rbenv init -)"

# tmuxinator
export EDITOR='nvim'

# k9s
export KUBE_EDITOR='nvim'

# fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    --height 40% --tmux 100%,50% --layout reverse
    --preview "cat {}" --bind "enter:become(nvim {})"'

# aliases
alias ll='ls-go -alkSi'
alias mux='tmuxinator'
alias k='kubectl'
alias kapply='kubectl apply -k .'
alias kus='kustomize'
alias g='lazygit'
alias d='lazydocker'
alias dc='docker-compose'
alias klog='kubectl logs -f -n'
alias cpufetch='~/cpufetch/cpufetch'
alias gpufetch='~/gpufetch/gpufetch'
alias cd='z'
alias cat='bat --color=always --style=numbers --line-range=:500'

# go stuff
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# nvidia stuff
export CMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc
export CMAKE_CUDA_COMPILER_TOOLKIT_ROOT=/opt/cuda

# tmux stuff

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/tmux-session-wizard/bin:$PATH

# zoxide
eval "$(zoxide init bash)"

# mangohud
export MANGOHUD=1

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# launch tmux on start
[ -z "$TMUX" ] && { mux main; }

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

eval "$(starship init bash)"

macchina

# ble.sh
[[ ${BLE_VERSION-} ]] && ble-attach
