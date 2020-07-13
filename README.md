# EKS


- This terraform module will create a EKS Cluster.
- This project is a part of opstree's ot-aws initiative for terraform modules.

## Usage

- Create a .tfvars file to enter the variables that were defined in the variables files and main.tf.
- Once you accomodate all the vars inside the .tfvars file, Give the below command,

terraform init

Once you see, there are no errors, proceed with the below.

terraform apply


Note:  If you encounter any issues or see errors in terraform init, it could be due to variable values not properly accomodated. Please refer the tfvars file that I have uploaded in the repo and replace the values of your environment and use it. Once you see everything looks good with init, as instructed above proceed with terraform apply.



Sample log of terraform init, terraform apply has been uploaded. Please refer the same to  compare your results. Once you see the cluster deployed, you will need to add the new cluster to the kubeconfig file. Give the below command to do the same. By doing this you are connected to your cluster that you  just deployed.


aws eks --region <Region where eks is deployed> update-kubeconfig --name <eks cluster name>

## Example:
 /workspace/terraform-aws-eks2: aws eks --region ap-south-1 update-kubeconfig --name eks-cluster 

 Gives output as below -

Added new context arn:aws:eks:ap-south-1:<xxxx>:cluster/eks-cluster to /Users/sreekar/.kube/config


You will now be able to query the eks cluster using kubectl. Go ahead and try few get commands of kubectl(Log file also has two commands )

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name | Name of Your Cluster. | string | null | yes |
| vpc_subnet | A list of subnet IDs to launch resources in. | List | null | yes |
| eks_cluster_version | Define Kubernetes Version to install. | string | null | yes |
| eks_cluster_tag | eks Cluster Tag. | map(string) | null | yes |
| node_group_name | node group name to attach in EKS. | string | null | yes |
| instance_type | Define Instance type ie. "t2.medium". | lint(string) | null | yes |
| disk_size | Define Disk size of nodes. | number | null | yes |
| scale_min_size | Define minimum nodes scaling. | number | null | yes |
| scale_max_size | Define Max nodes scaling. | number | null | yes |
| scale_desired_size | Define Desire nodes. | number | null | yes |
| scale_desired_size | Define Desire nodes. | number | null | yes |


## Outputs

| Name | Description |
|------|-------------|
| launch_template_name | Name of the launch template |
| launch_template_default_version | Default of the launch template |
| launch_template_latest_version | Latest of the launch template |
| target_group_arn | ARN of the target group |
| route53_name | Name of the record created |


## Destroy the Cluster

If you want to destroy the cluster that terraform has created it, give the below command,

terraform destroy.

Post the command execution, terraform will delete all the objects that it has  created during the apply stage. It could take some time for deletion, so please wait untill it completes.

Note: To make sure Terraform has deleted all the resources it has created using terraform apply, compare  the number that it shows as Deleted objects with the nunber that was displayed during the creation of resources. In my case here, it created 9 objects and deleted all the 9 objects on passing destroy command. Refer the log for these details.


### Contributors

Sreekar Achanta(sreekar.achanta07@gmail.com)


Note: I've formed this repo by pulling the code and related configs from the original author and so I/author don't hold any responsibility for  any billing issues or any issues in your environments. Please use your discretion. 

### Original Contributor

Devensh Sharma
https://github.com/deveshs23


