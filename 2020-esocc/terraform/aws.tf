
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

variable "region" {
  default = "eu-west-1"
}


resource "aws_db_parameter_group" "default" {
  family = "mysql5.7"
  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "db" {
  name                 = "db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "pc"
  password             = "petclinic"
  parameter_group_name = "default.mysql5.7"
}


resource "aws_s3_bucket" "bucket_pet_clinic" {
  bucket = "edmm_application_bucket_pet_clinic"
}

resource "aws_s3_bucket_object" "bucket_object_pet_clinic" {
  bucket = aws_s3_bucket.bucket_pet_clinic.id
  key    = "pet_clinic/petclinic.war"
  source = "C:\work\edmm\getting-started\spring-petclinic\target\petclinic.war"
}

resource "aws_elastic_beanstalk_application" "app_pet_clinic" {
  name        = "pet_clinic"
  description = "Application created by Terraform"
}

resource "aws_elastic_beanstalk_application_version" "app_pet_clinic_version" {
  name        = "pet_clinic_v1.0.0"
  application = "pet_clinic"
  description = "Application version created by Terraform"
  bucket      = aws_s3_bucket.bucket_pet_clinic.id
  key         = aws_s3_bucket_object.bucket_object_pet_clinic.id
}


