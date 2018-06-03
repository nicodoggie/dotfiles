# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

alias gssh="gcloud compute ssh"
alias gscp="gcloud compute scp"
alias gprojects="gcloud projects list"
alias gproj="gcloud config set project"
alias gproject="gcloud config set project"
alias gzone="gcloud config set compute/zone"
alias gzones="gcloud compute zones list"
alias ginstances="gcloud compute instances list"
