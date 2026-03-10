variable "create" {
  description = "Whether to create network and subnets"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of network"
  type        = string
  default     = "example-network"
}

variable "name_prefix" {
  description = "Name prefix of network"
  type        = string
  default     = "prefix"
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix before name or not"
  type        = bool
  default     = true
}

variable "description" {
  type        = string
  description = "Description of network"
  default     = "Example Network"
}

variable "admin_state_up" {
  type        = bool
  description = "The administrative state of the network"
  default     = true
}

variable "az" {
  type        = list(string)
  description = "An availability zone is used to make network resources highly available."
  default     = ["nova"]
}

variable "router" {
  description = "Information used to create and/or connect router to subnets"
  type = object({
    create                 = bool
    name                   = string
    description            = string
    external_network_id    = string
    enable_snat            = bool
    force_destroy          = bool
    external_qos_policy_id = string
  })
  default = {
    create                 = true
    name                   = "example-router"
    description            = "Example Router"
    external_network_id    = "public"
    enable_snat            = true
    force_destroy          = false
    external_qos_policy_id = null
  }
}

variable "router_tags" {
  description = "Tags for the router"
  type        = list(string)
  default     = ["example"]
}

variable "router_fixed_ips" {
  description = "List of external fixed IPs for the router"
  type = list(object({
    subnet_id  = string
    ip_address = string
  }))
  default = []
}

variable "subnets" {
  description = "List of subnets"
  type        = list(any)
  default = [
    {
      name                 = "example-subnet-1"
      cidr                 = "10.0.1.0/24"
      ip_version           = 4
      dns_nameservers      = ["8.8.8.8"]
      enable_dhcp          = true
      dns_publish_fixed_ip = true
    },
    {
      name            = "example-subnet-2"
      cidr            = "10.0.2.0/24"
      ip_version      = 4
      dns_nameservers = ["8.8.8.8"]
      enable_dhcp     = true
    }
  ]
}

variable "subnet_tags" {
  description = "List of tags for each subnet"
  type        = list(list(string))
  default     = [["subnet-1"], ["subnet-2"]]
}
