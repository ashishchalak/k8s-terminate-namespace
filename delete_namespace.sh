NAMESPACE=test

kubectl get ns

kubectl get namespace $NAMESPACE -o json >$NAMESPACE.json

# If JSON processor is installed use below line else use sed
#kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >$NAMESPACE.json

cat $NAMESPACE.json

grep -rl  '"kubernetes"' $NAMESPACE.json | xargs sed -i "s/\"kubernetes\"/""/g" 

cat $NAMESPACE.json

#Kubernetes cluster: kubectl proxy

#You should see the output as: Starting to serve on 127.0.0.1:8001

curl -k -H "Content-Type: application/json" -X PUT --data-binary @${NAMESPACE}.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize

kubectl get ns
