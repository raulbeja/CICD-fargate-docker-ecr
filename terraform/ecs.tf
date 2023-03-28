resource "aws_ecs_cluster" "ecs_fargate_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  container_definitions     = data.template_file.ecs_task_definition_template.rendered
  family                    = var.ecs_cluster_name
  cpu                       = var.ecs_task_cpu
  memory                    = var.ecs_task_memory
  requires_compatibilities  = ["FARGATE"]
  network_mode              = "awsvpc"
  execution_role_arn        = aws_iam_role.fargate_iam_role.arn
  task_role_arn             = aws_iam_role.fargate_iam_role.arn
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.ecs_fargate_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.desired_task_number
  launch_type     = "FARGATE"

  network_configuration {
    subnets           = [for subnet in aws_subnet.priv_subnet : subnet.id]
    security_groups   = [aws_security_group.app_sg.id]
    assign_public_ip  = true
  }

  load_balancer {
    container_name   = var.container_name
    container_port   = var.container_port
    target_group_arn = aws_alb_target_group.ecs_alb_tg.arn
  }
}

resource "aws_cloudwatch_log_group" "myapp_log_group" {
  name = "${var.ecs_service_name}-log-group"
}