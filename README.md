
## Setup

1. Apply the `remote_state` terraform project. This will create s3 bucket and lock table for keeping remote state for other tf projects.
```bash
cd infra/accounts/dev/remote_state; terraform init; terraform apply
```
2. Apply the `ecs` terraform project.
```bash
cd infra/accounts/dev/ecs; terraform init; terraform apply
```
This will output
* URL to access the web server.
* ECR repo url where docker images should be pushed.

## Development
1. Make desired code changes to `src` directory.
2. Run docker build
```bash
cd src; docker build -t <docker_ecr_repo_url>:<version> .
```
3. Docker login into the ECR repo
```bash
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <ecr_repo_url>
```
4. Publish docker image 
```bash
docker push <docker_ecr_repo_url>:<version>
```
5. Apply the `ecs` terraform project with the version provided in above step
```bash
cd infra/accounts/dev/ecs; terraform apply -var="release_version=<release_version>"

