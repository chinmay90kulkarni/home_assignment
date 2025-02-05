<h1>How to debug docker application level issues? </h1>

<br>

1. Docker Ec2 machine is deployed in private subnet for security reasons.
2. To do the SSH into it, we need to login into bastion host and from there, we have to login into docker Ec2 machine.

To copy .pem file from bastian host to Ec2 Docker instance, below command is used. This command needs to be run from bastion host. 

```
scp -i my-valid-key.pem   my-valid-key.pem ec2-user@<public_IP_address>:/home/ec2-user/
```