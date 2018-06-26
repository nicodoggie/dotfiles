# Load tmux first!
if [ -z $SSH_CONNECTION -a -z $TMUX ]; then
  base_session='tmux'
  # Create a new session if it doesn't exist
  tmux has-session -t $base_session > /dev/null || tmux new-session -s $base_session > /dev/null
  # Are there any clients connected already?
  client_cnt=$(tmux list-clients | wc -l)
  if [ $client_cnt -ge 1 ]; then
      session_name=$base_session"-"$client_cnt
      tmux new-session -d -t $base_session -s $session_name
      tmux -2 attach-session -t $session_name \; set-option destroy-unattached
  else
      tmux -2 attach-session -t $base_session
  fi
elif [ ! -z $TMUX ]; then
  export TERM="tmux-256color"
fi

if [ -x /usr/bin/nvim ]; then
  alias vim=/usr/bin/nvim
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

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=14"
bindkey '^ ' autosuggest-accept

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

alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -lah'

alias fucking=sudo
alias emacs="emacsclient -c"

eval $(dircolors $HOME/.config/dircolors)
