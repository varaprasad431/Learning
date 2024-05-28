aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

aws s3api create-bucket --bucket varaprasad431.k8s.local --region us-east-1
aws s3api put-bucket-versioning --bucket varaprasad431.k8s.local --region us-east-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://varaprasad431.k8s.local
kops create cluster --name varaprasad431.k8s.local --zones us-east-1a --master-count=1 --master-size t2.micro --node-count=2 --node-size t2.micro
kops update cluster --name varaprasad431.k8s.local --yes --admin


#after you can use this command
# export KOPS_STATE_STORE=s3://varaprasad431.k8s.local
# if in case you see this error
