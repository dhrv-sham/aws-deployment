### Git init Commands
```sh
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/dhrv-sham/aws-deployment.git
git push -u origin main
```


### Start with the Local Stack
```sh
colima start
localstack start
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
# create stream for accessing dummy aws through localhost
aws --endpoint-url=http://localhost:4566 kinesis create-stream --stream-name test-stream --shard-count 1
aws --endpoint-url=http://localhost:4566 kinesis list-streams
```

### AWS Basics 
* instances are shown region wise correct region is very important 
* SSH stands for the secure shell a cryptographic network protocol encrypts all data transmitted b/w client and server common usage is to connect remote server through terminal
* we need SSH server and SSH clients to have a ssh connection betwwen server and clients 


##### Create S3 buckets for testing
* Always remember to add --endpoint-url=http://localhost:4566 when you are using localstack for aws deployments
```sh
aws --endpoint-url=http://localhost:4566 s3 mb s3://my-test-bucket
aws --endpoint-url=http://localhost:4566 s3 ls
```

##### Linux System
* Types of user have linux have 
* -> regular user (only access their own file)
* -> superuser (administrative access)
* -> System accounts (running backrgound task like webservers)

```sh
pwd
sudo ls /root
# create file
touch file-name.ext
# open file on vi editor
vi file-name.ext
# remove the file 
rm file-name.ext
# :wq for write and exit 


```


### Docker Commands
* Default ports - > Port 80: HTTP  -->  port 443 : HTTPS --> port 22 : SSH
* localhost : 127.0.0.1 
* localhost with port number 8888 : 127.0.0.1:8888
* while running the only create comand if you want to have a terminal as well  interaction you need to add -it when creating 
* creating command is immutable without -it means container cant go with terminal and interactive terminal
* also remember while starting the created container you need to add -i for interactive 
```js
// To see the hostory of an image
docker image history $img_name
docker image inspect $img_name
docker image pull $img_name:$img_v
docker logs $id
// running different program apart from default program from a container which is instaled in the container 
// docker run -it --rm python bash
docker run -flags $img_name $prgm_name
// to  get the contents of the root directory of container
docker run $img_name ls
```

##### Access Running containers
* No need to write container keyword
```js
// container created 
docker container run -flags --name $cnt_name $img_name
// running another program in the container
docker container exec -flags $cnt_name $prgm_name
```

### Nginx server
* default port is 80 for nginx
* -it  : interactive mode flag [ -t : terminal allocate to container   | -i : interactive to console]
* -d : detached mode flag
```js
docker pull nginx
docker run -it -p host-port:container-port $img-name
docker run -d -p host-port:container-port $img-name
```

##### Docker Deployment on AWS Linux Server and Apache Web server
* Key-pair login is for ssh conenction 
* While adding a key-pair remeber to add key-pair in EC2 key-pair page remember to do this only when you are adding a new key-value pair 
* On getting instance stop ipv4 address also got changes 

##### Generate SSH keys --  Port [22]
* Private key to developer
* Public key to aws platform
* Add public keys to key-pair value in EC2
```sh
ssh-keygen -t ed25519
ls ~/.ssh
cat ~/.ssh/id_ed25519.pub
```

##### Access EC2 machine thorugh your local host 
```sh
# if EC2 is an ubuntu which is an username --->  root should be replaced by username 
# ssh root@public-ipv4
ssh ubuntu@public-ipv4
```


### EC2 Server 
* EC2 is a virtual server running on aws cloud 
* EC2 has certain features like memory,storage,cpu,networking-setup
* ami-id virtual reference of instance
* Public IPv4 address used to connect instance SSH
* Make Sure SSH file are just for read purpose 
* In Network section we have IPV4 which specify whose should access the instance from the outside world
* private ec2 can be accessed by the public ec2 only 

##### User Data Script
* script used for installing the packages when the system ec2 instance starts working can be seen under the advanced section of the settings
* When you access your EC2's public IP (e.g., http://<EC2-Public-IP>), Apache automatically serves the default file in the /var/www/html/ directory.


```sh
# for network information
curl ipinfo.io
```

##### VPC Virtual Private Connection
* NAT Gateway - intermidiate b/w the private-system and the internet only request from private-subnet are allowed not the request from outside to private subnet
* Nat always be associated with public subnet which is gonna be used by private subnet
* public subnet - part of vpc expose public on internet
* private subnet - part of vpc expose internally to internet
* IPV4 {CIDR} - CIDR (Classless Inter-Domain Routing) used for number used for the networking
* Breaking It Down: 11.0.0.0/16 means all IPs from 11.0.0.0 to 11.0.255.255 (65,536 addresses).
* The /16 means the first 16 bits (11.0) are fixed, and the rest can be used for devices.
* Internet Gateways -> always assocaited to public subnet how public resources accessed by internet
* RouteTable -> Allows resources in a subnet to communicate with the desired resource .
* RouteTable always need to associated with the subnet you are pointing
* subnet (11.0.1.0/24) <- routeTable <- internetGateway (0.0.0.0/0)
* Elastic Ip address - Unchanged IPV4 address even when the instance are restarted

```sh

``` 

##### Security Groups [rules b|w the aws resources]
* control the inbound and outbound traffic rules between aws resources like loadbalancer , ec2 and buckets   through Port and sorce 
* where as firewall is responsible for the request made between aws and the user  
* inbound is the incoming request from user to ec2
* Outbound traffic is data that moves from a network to an external destination
* 0.0.0.0/0 points to all the ip addresses
* SSH default port is 22
* HTTP default port is 80 
* ICMP protocol  is an ping command used for making an connection  







