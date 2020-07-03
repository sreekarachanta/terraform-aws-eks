  cluster_name        = "eks-cluster"
  eks_cluster_version = "1.15"
  vpc_subnet          = [
                          "subnet-1905ae55",
                          "subnet-392cc142", 	
                          ]
  node_group_name     = "eks-node-group"
  instance_type       = ["m5a.xlarge"]
  eks_cluster_tag     = { "test-esk" = "test" }
  disk_size           = 40
  scale_desired_size  = 3
  scale_max_size      = 5
  scale_min_size      = 2