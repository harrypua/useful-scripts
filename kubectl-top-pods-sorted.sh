#all namespaces
kubectl top pods --all-namespaces | sort --reverse --key 4 --numeric

#one namespace
kubectl top pods -n (namespace) | sort --reverse --key 3 --numeric
