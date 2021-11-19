# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

function __getname() {
   jq=$1
   shift 1
   filter=$2
   command="$@"
   json=`bash -c "$command --format json | jq -r $jq"`

   eval $command
}

alias gssh="gcloud beta compute ssh --internal-ip"
alias gscp="gcloud beta compute scp --internal-ip"
alias gprojects="gcloud projects list"
alias gproj="gcloud config set project"
alias gproject="gcloud config set project"
alias gzone="gcloud config set compute/zone"
alias gzones="gcloud compute zones list"
alias ginstances="gcloud compute instances list"
alias gclusters="gcloud container clusters list"

alias ginst="__getname '.[].name' gcloud compute instances list"

