# !/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/rbac-role.yaml

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/iam-policy.json

aws iam create-policy --policy-name ALBIngressControllerIAMPolicy --policy-document file://iam-policy.json > out.json

PolicyARN=$(cat out.json | jq '.Policy.Arn')

eksctl create iamserviceaccount \
       --cluster=attractive-gopher \
       --namespace=kube-system \
       --name=alb-ingress-controller \
       --attach-policy-arn=$PolicyARN \
       --override-existing-serviceaccounts \
       --approve

curl -sS "https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/alb-ingress-controller.yaml" \
     | sed "s/# - --cluster-name=devCluster/- --cluster-name=attractive-gopher/g" \
     | kubectl apply -f -

#Use below command if need to verify the logs of aws-alb-ingress-controller
#kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o alb-ingress[a-zA-Z0-9-]+)

kubectl apply -f manifests.yaml
