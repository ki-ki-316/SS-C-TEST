provider "aws" {
  region  = "ap-southeast-2"
  default_tags {
    tags = {
      Organisation = "kiki"
      Environment  = "test"
    }
  }
}
