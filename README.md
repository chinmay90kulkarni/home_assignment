<h1> Procedure to execute Home assignment. </h1>

<br>
Setup AWS secrets and key in environment variable. Do not save key in the file or in terraform environment variable.

```
export AWS_ACCESS_KEY_ID=<>
export AWS_SECRET_ACCESS_KEY=<>
export AWS_DEFAULT_REGION=us-east-1
```

<h3> What all changes are required in the terraform code to run? </h3>

<br>

These are the [variable changes](./README_TERRAFORM.md) required before hitting terraform plan and apply command.


Go inside folder of Terraform and then type below commands:

1. terraform validate
2. terraform plan
3. terraform apply -auto-approve

Once terraform plan is successful, open Load balancer DNS and open it in the browser. This is how the image should look like.

![Application image](Images/ready_application.png?raw=true "Docker application running page")

