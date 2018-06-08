alias clusters="gcloud container clusters list"
alias pods="kubectl --all-namespaces=true get pods -o wide"
alias hpa="kubectl --all-namespaces=true get hpa -o wide"
alias deployments="kubectl --all-namespaces=true get deployments"
alias secrets="kubectl --all-namespaces=true get secrets -o wide"
alias nodes="kubectl get node -o wide"
alias drain-node="kubectl drain --force --ignore-daemonsets"
alias instances="gcloud compute instances list"
alias configs="kubectl --all-namespaces=true get configmaps -o wide"

function kubeclean() {
    if [ -z "$1" ]
      then
        echo "No argument supplied => kubeclean namespace"
        exit 0
    fi

    namespace=$1
    kubectl delete namespace $namespace
    helm ls | ag $namespace | awk '{print $1}' | xargs helm delete --purge
}
export -f kubeclean

function __kubetail() {
    if [ -z "$1" ]
      then
        echo "No argument supplied => podname prefix [namespace]"
        exit 0
    fi

    podlist=$(kubectl --all-namespaces=true get pods)
    podinfo=$(echo $podlist | grep Running | grep "$1" | head -n1)
    podname=$(echo $podinfo | awk '{print $2}')
    podnamespace=$(echo $podinfo | awk '{print $1}')

    shift

    kubetail $podname --namespace $podnamespace "$@"
}
alias kubet='__kubetail'

function __kubeexec() {
    if [ -z "$1" ]
      then
        echo "No argument supplied => podname prefix [namespace]"
        exit 0
    fi

    podlist=$(kubectl --all-namespaces=true get pods)
    podinfo=$(echo $podlist | grep Running | grep "$1" | head -n1)
    podname=$(echo $podinfo | awk '{print $2}')
    podnamespace=$(echo $podinfo | awk '{print $1}')

    shift

    kubectl --namespace=$podnamespace exec -it $podname "$@"
}
alias kubex='__kubeexec'

function __podname() {
    if [ -z "$1" ]
      then
        echo "No argument supplied => podname prefix [namespace]"
        exit 0
    fi

    if [ -z "$2" ]
      then
        kubectl --all-namespaces=true get pods | grep "$1" --line-buffered | awk '{print $2}'
    else
        kubectl --namespace=$2 get pods | grep "$1" --line-buffered | awk '{print $2}'
    fi
}
alias podname='__podname'

function __kubetoken() {
    token=$(kubectl get secrets --namespace default | grep default-token | head -n1 | cut -f1 -d' ')
    echo $(kubectl get secret ${token} -o json | jq '.data.token' | cut -d\" -f2 | base64 -d )
}
alias token='__kubetoken'
