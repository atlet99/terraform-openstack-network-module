# Terraform OpenStack Network Module

Terraform module which creates networks including subnets and optionally router on OpenStack.

**Note:** This module requires **Terraform version 1.5.0** or higher and **OpenStack provider version 3.0.0** or higher.

## Features

This modules aims to make it more compact to setup network, subnets and routers:

- Create a network and list of defined subnets
- Support for subnet routes
- Support creation of router if needed
- Subnets can be connected with router in module using `@self` notation

## Terraform versions

Terraform >= 1.5.0.

## Usage

```hcl
module "network-module" {
  source  = "atlet99/network-module/openstack"
  version = "1.0.3"
  # insert the 2 required variables here
}
```

### Network with one subnet and router

```hcl
module "example_net" {
  source  = "atlet99/network-module/openstack"
  version = "1.0.3"

  name   = "example"
  router = {
    create              = true
    external_network_id = "ext-net-id"
  }
  subnets = [
    { cidr = "192.168.1.0/24", router_id = "@self" },
  ]
}
```

## License

This is an open source project under the [MIT](https://github.com/atlet99/terraform-openstack-network-module/blob/master/LICENSE) license.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 3.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 3.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.8.1 |

## Resources

| Name | Type |
|------|------|
| [openstack_networking_network_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_router_interface_v2.this_router_id](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_v2) | resource |
| [openstack_networking_subnet_route_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_route_v2) | resource |
| [openstack_networking_subnet_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_state_up"></a> [admin\_state\_up](#input\_admin\_state\_up) | The administrative state of the network | `bool` | `null` | no |
| <a name="input_az"></a> [az](#input\_az) | An availability zone is used to make network resources highly available. | `list(string)` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create network and subnets | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of network | `string` | `"Managed by Terraform"` | no |
| <a name="input_dns_domain"></a> [dns\_domain](#input\_dns\_domain) | The network DNS domain | `string` | `null` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | The network maximum transmission unit (MTU) | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of network | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix of network | `string` | `""` | no |
| <a name="input_port_security_enabled"></a> [port\_security\_enabled](#input\_port\_security\_enabled) | Whether the network should have port security enabled or not | `bool` | `null` | no |
| <a name="input_qos_policy_id"></a> [qos\_policy\_id](#input\_qos\_policy\_id) | The QoS policy ID for the network | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created | `string` | `""` | no |
| <a name="input_router"></a> [router](#input\_router) | Information used to create and/or connect router to subnets | <pre>object({<br/>    create                 = bool<br/>    name                   = optional(string, null)<br/>    description            = optional(string, null)<br/>    external_network_id    = string<br/>    enable_snat            = optional(bool, false)<br/>    force_destroy          = optional(bool, false)<br/>    external_qos_policy_id = optional(string, null)<br/>  })</pre> | n/a | yes |
| <a name="input_router_fixed_ips"></a> [router\_fixed\_ips](#input\_router\_fixed\_ips) | List of external fixed IPs for the router | <pre>list(object({<br/>    subnet_id  = string<br/>    ip_address = string<br/>  }))</pre> | `[]` | no |
| <a name="input_router_tags"></a> [router\_tags](#input\_router\_tags) | Tags for the router | `list(string)` | `[]` | no |
| <a name="input_subnet_tags"></a> [subnet\_tags](#input\_subnet\_tags) | List of tags for each subnet | `list(list(string))` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets | `list(any)` | `[]` | no |
| <a name="input_transparent_vlan"></a> [transparent\_vlan](#input\_transparent\_vlan) | Set to true to enable transparent VLANs | `bool` | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Whether to use name\_prefix before name or not | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the network |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | The ID of the router |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | List of created subnets |
<!-- END_TF_DOCS -->
