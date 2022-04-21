# Testing environment base

terraform {
    source = "${get_env("HOME")}/today/aws-cluster-ecs-apps-terraform//"
}

remote_state {
    backend = "s3"
    config = {
        bucket = "terraform-state-0421-testing"
        key = "cluster/apps/testing/${path_relative_to_include()}-terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-dynamo-0421-testing"
    }
}

inputs = {
    # General
    aws_account_id = "838127195462"
    aws_region = "us-east-1"
    aws_vpc_id = "vpc-0223110d1147a124c"
    base_tags = {
        env         = "Testing"
        createdFrom = "terraform"
    }

    # Task Definition defaults
    # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size
    task_cpu = "256" # .25 vCPU
    task_memory = "1024"
    task_cpu_architecture = "ARM64" # "X86_64"
    task_os_family = "LINUX" # "WINDOWS"

    # Container defaults
    container_cpu = "256" # .25 vCPU

    # Service defaults
    cluser_name = "TestingFargateCluster"
    service_subnets = ["subnet-0c8e939ad74e293ea", "subnet-0775349bcd435664b"]
    service_sg_ids = ["sg-04b32d08a76b19335"]
    service_desired_count = 2

    # Target group and listener defaults
    tg_alb_arn = "arn:aws:elasticloadbalancing:us-east-1:838127195462:loadbalancer/app/TestingFargateALB/26743943e19301a3"
    listener_arn = "arn:aws:elasticloadbalancing:us-east-1:838127195462:listener/app/TestingFargateALB/26743943e19301a3/cd59e7a184b6bc82"
    tg_port = "80"

}
