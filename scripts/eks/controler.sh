cluster_name=<provide cluster name here>
env=<provide Environment name here>
account_id="<provide account id here>"
curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.2/docs/install/iam_policy.json
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy$env --policy-document file://iam_policy.json
#service account
eksctl create iamserviceaccount --cluster=$cluster_name --namespace=kube-system --name=aws-load-balancer-controller-$env --role-name "AmazonEKSLoadBalancerControllerRole$env" --attach-policy-arn=arn:aws:iam::$account_id:policy/AWSLoadBalancerControllerIAMPolicy$env --approve
#helm system
sudo snap install helm --classic
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=$cluster_name --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller-$env
