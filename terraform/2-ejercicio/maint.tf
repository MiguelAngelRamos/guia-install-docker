provider "aws" {
  region = "us-east-2"
}
## Configurando los DataSource  AZ = Availability Zone
data "aws_subnet" "az_a" {
  availability_zone = "us-east-2a"
}

data "aws_subnet" "az_b" {
  availability_zone = "us-east-2b"
}
#subnet-0b8c0a8a6ffb1bd52 -> us-east-2a  2c 2b
resource "aws_instance" "servidor1" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  #subnet_id = "subnet-0b8c0a8a6ffb1bd52"
  subnet_id = data.aws_subnet.az_a.id
  vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Kibernum Academy! servidor 1"> index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "servidor-1"
  }
}

resource "aws_instance" "servidor2" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.az_b.id
  vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Kibernum Academy! servidor 2"> index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "servidor-2"
  }
}

resource "aws_security_group" "mi_grupo_de_seguridad" {
  name = "primer-servidor-sg"

  ingress {
    security_groups = [aws_security_group.alb.id]
    description = "Acceso al puerto 8080 desde el exterior"
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
  }
}

# --- CONFIGURACION DEL LOAD BALANCER - alb (application load balancer) --- 

resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name = "kibernum-alb"
  security_groups = [aws_security_group.alb.id]
  subnets = [data.aws_subnet.az_a.id, data.aws_subnet.az_b.id]
}

resource "aws_security_group" "alb" {
  name = "alb-sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 80 desde el exterior"
    from_port = 80
    to_port = 80
    protocol = "TCP"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 8080 de nuestros servidores"
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
  }
}

data "aws_vpc" "default" {
  default = true # el data source trae la vpc por default
}

resource "aws_lb_target_group" "this" {
  name = "kibernum-alb-target-group"
  port = 80
  vpc_id = data.aws_vpc.default.id
  protocol = "HTTP"

  health_check {
    enabled = true
    matcher = "200"
    path = "/"
    port = "8080"
    protocol = "HTTP"
  }
}

## attachment adjuntos
resource "aws_lb_target_group_attachment" "servidor_1" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id = aws_instance.servidor1.id # es la instancia 
  port = 8080 # el el puerto que tiene abierto nuestras instancias
}

resource "aws_lb_target_group_attachment" "servidor_2" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id = aws_instance.servidor2.id
  port = 8080
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.alb.arn # es nuestro load balancer de la linea 58
  port = 80
  protocol = "HTTP"
  ## vamos hacer forward de todas las peticiones que entren hacia nuestro target group
  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type = "forward"
  }
}