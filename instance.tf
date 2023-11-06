# Create an IAM instance profile
resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "my-iam-instance-profile" 
  role = aws_iam_role.my_role.name
}

# Launch an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-05c13eab67c5d8861"      # This ami id is in us-east-1  
  instance_type = "t2.micro"  
  key_name      = "new"  # Replace with your actual key pair name
  iam_instance_profile = aws_iam_instance_profile.example_instance_profile.name

  tags = {
    Name = "my-project-server" 
  }
}
