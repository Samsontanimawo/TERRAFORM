# Create a provider AWS; region us-east-1 

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  count = 6
  
  ami           = "ami-0fe630eb857a6ec83"
  instance_type = "t2.micro"
  key_name = "ProdAWSInstance"

  tags = {
    Name = "${element(var.instance_names, count.index)}"
  }
}

variable "instance_names" {
  default = ["Nginx_Server", "Ansible_automation_instance", "Docker_instance", "Kubernetes_Instance", "Grafana_Instance", "Prometheus_instance"]
  type    = list(string)
}

# terraform init = To initialize it
# terraform plan to check the plan
# terraform apply to take action
# terraform destroy to terminate the instances