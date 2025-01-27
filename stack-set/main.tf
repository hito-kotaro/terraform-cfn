provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_cloudformation_stack_set" "example_stackset" {
  administration_role_arn = "arn:aws:iam::665378081513:role/AWSCloudFormationStackSetAdministrationRole"
  name               = "example-stackset"  # StackSet名
  template_body      = file("cloudformation-template.yml")  # テンプレートファイル
  description        = "Example StackSet for S3 bucket"

  capabilities = ["CAPABILITY_NAMED_IAM"]

  tags = {
    Environment = "Production"
  }
}

resource "aws_cloudformation_stack_set_instance" "example_instance" {
  stack_set_name    = aws_cloudformation_stack_set.example_stackset.name
  account_id        = "665378081513" # ターゲットアカウントID
  region            = "ap-northeast-1"   # ターゲットリージョン
}

