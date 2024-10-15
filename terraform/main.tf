provider "aws" {
  region                      = "eu-west-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  
  endpoints {
    sns = "http://localhost:4566"
    sqs = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "bucket"
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "logs"
}

resource "aws_sns_topic" "mytopic" {
  name = "PayTopic"
}

resource "aws_sqs_queue" "myqueue" {
  name = "pay_queue"
}

# Subscribe an HTTP endpoint to the SNS topic
#resource "aws_sns_topic_subscription" "http_subscription" {
#  topic_arn = aws_sns_topic.mytopic.arn
#  protocol  = "http"
#  endpoint  = "http://mainapp:3000/pay/status"
#  }