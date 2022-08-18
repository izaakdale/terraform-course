provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "myuser" {
  name = "Izaak"
}
resource "aws_iam_policy" "custompolicy" {
  name = "EC2-EKS"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:*",
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policybind" {
  name = "attachment"
  users = [aws_iam_user.myuser.name]
  policy_arn = aws_iam_policy.custompolicy.arn
}