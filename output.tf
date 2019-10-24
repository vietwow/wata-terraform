output "postgres_instance" {
  value = "${aws_instance.postgres.public_ip}"
}