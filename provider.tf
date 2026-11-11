terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-demo-bucket-12345"

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}

# Create an EC2 Instance
resource "aws_instance" "example_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (example)
  instance_type = "t2.micro"

  tags = {
    Name        = "DemoEC2"
    Environment = "Dev"
  }
}

# Output values
output "instance_id" {
  value = aws_instance.example_ec2.id
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}