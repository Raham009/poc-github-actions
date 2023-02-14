resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
}
resource "null_resource" "PowerShellScript" {
  provisioner "local-exec" {
    command = ".\script.ps1"
    interpreter = ["pwsh", "-Command"]
  }
}