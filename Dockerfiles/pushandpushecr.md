- curl -fsSL https://get.docker.com -o install-docker.sh
- sudo sh install-docker.sh
- sudo usermod -aG docker ubuntu
- docker version
- mkdir /nop
- mkdir nop
- cd nop
- vi Dockerfile
- docker image build -t love:1.0 .
- docker container run -d -P love:1.0
- docker container ls
- sudo apt install awscli
- aws --version
- aws configure
- docker login
- aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 514900916575.dkr.ecr.ap-south-1.amazonaws.com
- docker build -t nop:1.0 .
- docker push nop:1.0
- docker push 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- docker tag nop:1.0 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- docker push 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
- aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin  514900916575.dkr.ecr.ap-south-1.amazonaws.com
- TOKEN=$(aws ecr get-authorization-token --output text --query 'authorizationData[].authorizationToken')
- curl -i -H "Authorization: Basic $TOKEN" https://aws_account_id.dkr.ecr.region.amazonaws.com/v2/amazonlinux/tags/list
- curl -i -H "Authorization: Basic $TOKEN" https://514900916575.dkr.ecr.ap-south-1.amazonaws.com/v2/nop/tags/list
- aws ecr describe-repositories
- aws ecr describe-images --repository-name nop
- docker pull 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- docker image ls
- docker image rm 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- docker image ls
- docker pull 514900916575.dkr.ecr.ap-south-1.amazonaws.com/nop:1.0
- docker image- ls


Compose file:

Compose file 
The Compose file is a YAMLopen_in_new file defining:

Version (Optional)
Services (Required)
Networks
Volumes
Configs
Secrets