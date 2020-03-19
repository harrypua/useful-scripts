#top all namespaces
kubectl top pods --all-namespaces | sort --reverse --key 4 --numeric

#top one namespace
kubectl top pods -n (namespace) | sort --reverse --key 3 --numeric

#clear evicted
kubectl get pods --all-namespaces | grep Evicted | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod 
