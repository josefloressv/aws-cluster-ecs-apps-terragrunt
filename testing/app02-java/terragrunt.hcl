include {
    path = find_in_parent_folders()
}

inputs = {
    # Task definition
    task_name = "app02-java"
    task_tags = {
        "Name": "app02-java",
        "language": "java",
    }
    task_cpu_architecture = "X86_64" # "ARM64"

    # Container definition
    container_name = "java"
    container_image_name = "app02-java"
    container_port = "3000"

    # Service
    service_name = "svc-app02-java"
    service_desired_count = 1
    service_tags = {
        "Name": "svc-app02-java"
    }

    # Target group and listener
    tg_name = "app02-java-tg"
    listener_context_path = "/app02/*"
    tg_health_check_path = "/app02/health"
    tg_tags = {
        "Name": "app02-java-tg"
    }

}
