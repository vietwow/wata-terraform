resource "aws_instance" "postgres" {
  instance_type          = "t2.small"
  ami                    = "ami-0b5a5c971fc30e5d1"

  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  key_name               = "private_key"

  tags = {
    Name      = "Postgres"
    Terraform = "True"
  }

  connection {
    host = "${self.public_ip}"
    user = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa.pem")}"
  }

  provisioner "ansible" {
    plays {
        playbook {
          file_path = "ansible/postgres.yml"
        }

        hosts  = ["${self.public_ip}"]
        become = "true"
    }
  }

}
