### Create docker container
```shell
docker build -t mmodos/helloapp:v1 .
docker run -e USERNAME=$USERNAME helloapp:v1
```

### Install minikube
```shell
brew install minikube
minikube start
```

### Install and init helm
```shell
brew install helm
helm create assesment
```

### helm
```shell
helm lint
helm install helloapp ./
helm delete helloapp
```

### Install Jenkins
```shell
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm upgrade --install myjenkins jenkins/jenkins
# get user/passworld
kubectl exec --namespace default -it svc/myjenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-username && echo
kubectl exec --namespace default -it svc/myjenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
```