# OMG my zshrc is so ugly 🥺

source /Users/oluqman/Desktop/dev/ue/script/dev-commands.sh

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport BUNDLE_ENTERPRISE__CONTRIBSYS__COM=


eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

export JAVA_HOME=/usr/bin/java

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true

plugins=(git)

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# kafka stuff
export KAFKA_URL=kafka:9092
export MESSAGE_BUS=kafka

# bun completions
[ -s "/Users/oluqman/.bun/_bun" ] && source "/Users/oluqman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GO lang
export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/Users/oluqman/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export MODULAR_HOME="/Users/oluqman/.modular"
export PATH="/Users/oluqman/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

# wezterm
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# tmuxinator
export EDITOR='nvim'

# k9s
export KUBE_EDITOR='nvim'

# aliases
alias ll='ls-go -alkSi'
alias v='nvim'
alias mux='tmuxinator'
alias k='kubectl'
alias kapply='kubectl apply -k .'
alias kus='kustomize'
alias scolima='colima start --cpu 8 --memory 8 --vm-type vz --vz-rosetta --dns 8.8.8.8 --mount-type sshfs'
alias g='lazygit'
alias d='lazydocker'
alias t='tmux'
alias dc='docker-compose'
alias klog='kubectl logs -f -n'

# docker hack back nack okay jack? lol
# export DOCKER_HOST=$(docker context inspect | jq -r '.[0].Endpoints.docker.Host')

eval "$(starship init zsh)"


# Created by `pipx` on 2024-04-18 03:10:03
export PATH="$PATH:/Users/oluqman/.local/bin"

# launch tmux on start
[ -z "$TMUX"  ] && { exec tmux new-session -A -s main;}