# Testing environment base

terraform {
    #source = "${get_env("HOME")}/today/aws-cluster-ecs-apps-terraform//"
    source = "git::https://github.com/josefloressv/aws-cluster-ecs-apps-terraform.git"
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
    aws_vpc_id = "vpc-0cea2704062fcee57"
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
    service_subnets = ["subnet-0cc837a0674845f10", "subnet-045ac18328c741b31"]
    service_sg_ids = ["sg-0302babfac9f14aaa"]
    service_desired_count = 2

    # Target group and listener defaults
    tg_alb_arn = "arn:aws:elasticloadbalancing:us-east-1:838127195462:loadbalancer/app/TestingFargateALB/e0028cfa14086733"
    listener_arn = "arn:aws:elasticloadbalancing:us-east-1:838127195462:listener/app/TestingFargateALB/e0028cfa14086733/e7a7bf12ca0b5b81"
    tg_port = "80"

}
