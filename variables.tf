#########
# Network
#########
variable "create" {
  description = "Whether to create network and subnets"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of network"
  type        = string
}

variable "name_prefix" {
  description = "Name prefix of network"
  type        = string
  default     = ""
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix before name or not"
  type        = bool
  default     = false
}

variable "description" {
  type        = string
  description = "Description of network"
  default     = "Managed by Terraform"
}

variable "admin_state_up" {
  type        = bool
  description = "The administrative state of the network"
  default     = null
}

variable "az" {
  type        = list(string)
  description = "An availability zone is used to make network resources highly available."
  default     = null
}

variable "mtu" {
  type        = number
  description = "The network maximum transmission unit (MTU)"
  default     = null
}

variable "port_security_enabled" {
  type        = bool
  description = "Whether the network should have port security enabled or not"
  default     = null
}

variable "dns_domain" {
  type        = string
  description = "The network DNS domain"
  default     = null
}

variable "qos_policy_id" {
  type        = string
  description = "The QoS policy ID for the network"
  default     = null
}

variable "transparent_vlan" {
  type        = bool
  description = "Set to true to enable transparent VLANs"
  default     = null
}

########
# Router
########

variable "router" {
  description = "Information used to create and/or connect router to subnets"
  type = object({
    create                 = bool
    name                   = optional(string, null)
    description            = optional(string, null)
    external_network_id    = string
    enable_snat            = optional(bool, false)
    force_destroy          = optional(bool, false)
    external_qos_policy_id = optional(string, null)
  })
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = ""
}

#########
# Subnets
#########
variable "subnets" {
  description = "List of subnets"
  type        = list(any)
  default     = []
}

variable "router_tags" {
  description = "Tags for the router"
  type        = list(string)
  default     = []
}

variable "router_fixed_ips" {
  description = "List of external fixed IPs for the router"
  type = list(object({
    subnet_id  = string
    ip_address = string
  }))
  default = []
}

variable "subnet_tags" {
  description = "List of tags for each subnet"
  type        = list(list(string))
  default     = []
}
