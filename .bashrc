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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

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

# go stuff
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# nvidia stuff
export CMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc
export CMAKE_CUDA_COMPILER_TOOLKIT_ROOT=/opt/cuda

# tmux stuff

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/tmux-session-wizard/bin:$PATH

eval "$(zoxide init bash)"

# mangohud
export MANGOHUD=1

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

eval "$(starship init bash)"

# launch tmux on start
[ -z "$TMUX" ] && { mux main; }

[[ ${BLE_VERSION-} ]] && ble-attach

macchina

# Created by `pipx` on 2024-06-15 21:04:03
export PATH="$PATH:/home/omarluq/.local/bin"
