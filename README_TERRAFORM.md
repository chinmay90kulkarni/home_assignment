<h1> Couple of things to notice in a terraform code</h1>

<br>

<h3> In variables.tf update below variables values. </h3>

```
1. bastion_allowed_cidr -> This should be the public IP address of host machine.

2. key_name -> This is the key pair name which code expects to be there. Developers can use their common key. Just need to have it's name handly.. In my case, my-valid-key is the key name.

3. docker_image -> docker public image name which is used to deploy application on Ec2 machine. rg: this is the docker image name=yeasy/simple-web

```