
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

setopt autopushd pushdminus pushdsilent pushdtohome
setopt prompt_subst
fpath=("$HOME/.config/zsh" $fpath)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache


# Compinit
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

# Profile
source /etc/profile

# Bindkey 
bindkey -e
bindkey '\e[3~' delete-char

# Antigen-hs
#source ~/.config/zsh/antigen-hs/init.zsh
#source ~/.antigen-hs/antigen-hs.zsh

# Theme init
source ~/.zshrc.theme 

# Completions
source $HOME/.config/zsh/kubetools.zsh
source $HOME/.config/zsh/gcloudtools.zsh
source $HOME/.config/zsh/helm-completion.zsh
source /etc/bash_completions.d/kubie
# source /usr/share/nvm/init-nvm.sh

source <(kubectl completion zsh)

# Additional config
source $HOME/.zshrc.scripts
source $HOME/.zshrc.local
source $HOME/.zshrc.motd
source $HOME/.zshrc.theme

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/sls.zsh ]] && . /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/slss.zsh ]] && . /home/ensu/Projects/xsplit-ui/node_modules/tabtab/.completions/slss.zsh
source <(kubeadm completion zsh)

alias cd="cd -P"
[[ -d $HOME/.bookmarks ]] && export CDPATH=$HOME/.bookmarks

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

alias termrec="terminalizer --config $HOME/.config/terminalizer/config.yml record"
export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM=1
export PATH="$VOLTA_HOME/bin:$HOME/.cargo/bin:$HOME/.go/bin:$PATH"

eval "$(phpenv init -)"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON_SITEPACKAGES=1
