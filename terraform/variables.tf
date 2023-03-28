variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string 
}

variable "owner" {
  description = "Infrastructure Owner"
  type        = string
}

variable "env" {
  description = "Environment Variable used as prefix an tagging"
  type        = string
}

variable "ecr_name" {
  description = "Name of ECR Repo"
  type = string
}

variable "ecr_image_mutability" {
  description = "Provide image mutability"
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string 
}

variable "min_avz" {
  description = "Minimun number of availability zones"
  type        = number
}

variable "ecs_domain_name" {
  description = "Cluster Domain Name"
  type        = string 
}

variable "inet_cidr_block" {
  description = "Internet CIDR Block"
  type        = string 
}

variable "ecs_cluster_name" {
  description = "Cluster Name"
  type        = string 
}

variable "ecs_service_name" {
  description = "Application service name"
  type        = string 
}

variable "ecs_task_memory" {
  description = "ECS task memory"
  type        = string
}

variable "ecs_task_cpu" {
  description = "ECS task cpu"
  type        = string
}

variable "desired_task_number" {
  description = "Number of tasks"
  type        = number
}

variable "container_name" {
  description = "Docker Image URL"
  type        = string
}

variable "container_image" {
  description = "Docker Image URL"
  type        = string
}

variable "container_port" {
  description = "Application container exposed port"
  type        = number
}