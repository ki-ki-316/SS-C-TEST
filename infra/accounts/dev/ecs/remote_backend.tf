terraform {
  backend "s3" {
    key            = "dev/ecs/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "hello-world-state-locks"
    encrypt        = true
  }
}
