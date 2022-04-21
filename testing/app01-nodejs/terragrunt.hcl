include {
    path = find_in_parent_folders()
}

inputs = {
    # Task definition
    task_name = "app01-nodejs"
    task_tags = {
        "Name": "app01-nodejs",
        "language": "nodejs",
    }

    # Container definition
    container_name = "nodejs"
    container_image_name = "app01-nodejs"
    container_port = "3000"

    # Service
    service_name = "svc-app01-nodejs"
    service_desired_count = 1
    service_tags = {
        "Name": "svc-app01-nodejs"
    }

    # Target group and listener
    tg_name = "app01-nodejs-tg"
    listener_context_path = "/app01/*"
    tg_health_check_path = "/app01/health"
    tg_tags = {
        "Name": "app01-nodejs-tg"
    }

}
