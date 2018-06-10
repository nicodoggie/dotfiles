# Load tmux first!
export TERM="xterm-256color"
if [ -z $TMUX ]; then
    tmux
fi

setopt prompt_subst

# Compinit
autoload -Uz compinit
compinit
autoload bashcompinit
bashcompinit

# Antigen-hs
export ZSH=$HOME/.antigen-hs/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh/
source ~/.config/zsh/antigen-hs/init.zsh
source ~/.antigen-hs/antigen-hs.zsh


BULLETTRAIN_ARCANIST_BIN="/opt/arcanist/arcanist/bin/arc"
prompt_arcanist () {
  if [[ -f $BULLETTRAIN_ARCANIST_BIN ]]; then
    arc_summary=$(command $BULLETTRAIN_ARCANIST_BIN current --summary 2>/dev/null)
    if [[ "$arc_summary" != "" ]]; then
      prompt_segment green black "[arc] ${arc_summary}";
    fi
  fi
}

export BULLETTRAIN_KCTX_KCONFIG=$HOME/.kube/config
BULLETTRAIN_KCTX_BG=white
BULLETTRAIN_KCTX_BG=black
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    screen
    perl
    ruby
    virtualenv
    nvm
    kctx
    aws
    go
    elixir
    git
    hg
    cmd_exec_time
    arcanist
  )

eval "$(stack --bash-completion-script stack)"
source $HOME/.config/zsh/kubetools.zsh
source $HOME/.config/zsh/gcloudtools.zsh
source $HOME/.config/zsh/helm-completion.zsh

source /usr/share/nvm/init-nvm.sh
source /opt/arcanist/arcanist/resources/shell/bash-completion


alias fucking=sudo
alias emacs="emacsclient -c"

eval $(dircolors $HOME/.config/dircolors)
