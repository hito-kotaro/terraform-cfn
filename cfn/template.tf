provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_cloudformation_stack" "example" {
  name          = "tf-cfn-sample"
  template_body = file("template.yml") # ローカルテンプレートを指定

  tags = {
    Environment = "Dev"
  }
}