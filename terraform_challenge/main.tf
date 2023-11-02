provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# EC2 instance
resource "aws_instance" "web_instance" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  security_groups = [aws_security_group.instance_security_group.name]
  key_name        = "eliyas_key"
}

# Define the security group for the EC2 instance
resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group"
  description = "Allow incoming HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the RDS MySQL instance
resource "aws_db_instance" "db_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class       = "db.t2.micro"
  identifier           = var.db_name  # Use the 'identifier' attribute
  username             = "admin"
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"  # Correct the parameter group name
  skip_final_snapshot  = true

  tags = {
    Name = "RDS MySQL Database"
  }

  # Security group for RDS instance
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
}

# Define a security group for the RDS instance
resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "Allow incoming traffic on port 3306 from the EC2 instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.instance_security_group.id]
  }
}

