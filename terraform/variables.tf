variable "do_token" {
  description = "DigitalOcean API token"
  type        = string


}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa_do.pub"

}
