# CICD-fargate-docker-ecr
CICD pipeline for AWS Fargate using GitHub Actions to deploy ECR image (Nodejs for this)

## Assumptions
This project use a SSL Certificate for a given domain in ACM (Amazon Certificate Manager) and existing Route53 hosted zone. SSL Certificate need to be in the same region used to deploy web server.

Also use an existing IAM Role to access aws resources from Github with OpenIDConnect to avoid store aws credentials in secrets. Give IAM Role access permissions to ECR, ECS and S3

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::YOURACCOUNTID:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:YOUR_REPO/*:*"
                }
            }
        }
    ]
}
```
## Description
This is a fork of my previous repository https-fargate-cluster to add CI/CD pipeline for AWS fargate using github actions to deploy docker images. I use a basic Nodejs application for this example.

