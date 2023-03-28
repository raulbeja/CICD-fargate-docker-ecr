data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_route53_zone" "domain" {
  name         = "${var.ecs_domain_name}."
  private_zone = false
}

data "aws_acm_certificate" "ecs_domain_certificate" {
  domain      = "*.${var.ecs_domain_name}"
  statuses    = ["ISSUED"]
}

data "template_file" "ecs_task_definition_template" {
  template = file("task_definition.json")

  vars = {
    ecs_service_name      = var.ecs_service_name
    container_name        = var.container_name
    image_url             = var.container_image
    container_port        = var.container_port
    region                = var.aws_region
  }
}
