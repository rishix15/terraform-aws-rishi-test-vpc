variable "vpc_config" {
  description = "VPC configuration (CIDR + Name)"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR block - ${var.vpc_config.cidr_block}"
  }
}
  
  

variable "subnet_config" {
  description = "Subnet configuration"
  type = map(object({
    cidr_block = string
    az         = string
    public     = bool    # <— REQUIRED to use directly
  }))
}