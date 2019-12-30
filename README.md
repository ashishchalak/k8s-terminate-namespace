# k8s-terminate-namespace

If the namespace deletion is stuck in the Terminating state, use the script delete_namespace.sh

Just change the NAMESPACE name from test to the one that you may want to delete it.

Also make sure you are able to connect to kubernetes api server by following commands 

Kubernetes cluster: kubectl proxy

You should see the output as: Starting to serve on 127.0.0.1:8001
