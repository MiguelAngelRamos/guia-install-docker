output "dns_publica_servidor_1" {
  description = "DNS pública del servidor 1"
  value = "http://${aws_instance.servidor1.public_dns}:8080"
}

output "dns_publica_servidor_2" {
  description = "DNS pública del servidor 2"
  value = "http://${aws_instance.servidor2.public_dns}:8080"
}

output "dns_load_balancer" {
  description = "DNS pública del load balancer"
  value = "http://${aws_lb.alb.dns_name}"
}