# Complete Example

This example configures all available options in the `terraform-openstack-network-module`.

It provisions a network with custom MTU, DNS domain, port security settings, and multiple subnets with advanced configurations including IPv6 settings, allocation pools, service types, and tag assignations.

## Usage

To apply this example, run:

```bash
terraform init
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 3.2.0 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_state_up"></a> [admin\_state\_up](#input\_admin\_state\_up) | The administrative state of the network | `bool` | `true` | no |
| <a name="input_az"></a> [az](#input\_az) | An availability zone is used to make network resources highly available. | `list(string)` | <pre>[<br/>  "nova"<br/>]</pre> | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create network and subnets | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of network | `string` | `"Example Network"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of network | `string` | `"example-network"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix of network | `string` | `"prefix"` | no |
| <a name="input_router"></a> [router](#input\_router) | Information used to create and/or connect router to subnets | <pre>object({<br/>    create                 = bool<br/>    name                   = string<br/>    description            = string<br/>    external_network_id    = string<br/>    enable_snat            = bool<br/>    force_destroy          = bool<br/>    external_qos_policy_id = string<br/>  })</pre> | <pre>{<br/>  "create": true,<br/>  "description": "Example Router",<br/>  "enable_snat": true,<br/>  "external_network_id": "public",<br/>  "external_qos_policy_id": null,<br/>  "force_destroy": false,<br/>  "name": "example-router"<br/>}</pre> | no |
| <a name="input_router_fixed_ips"></a> [router\_fixed\_ips](#input\_router\_fixed\_ips) | List of external fixed IPs for the router | <pre>list(object({<br/>    subnet_id  = string<br/>    ip_address = string<br/>  }))</pre> | `[]` | no |
| <a name="input_router_tags"></a> [router\_tags](#input\_router\_tags) | Tags for the router | `list(string)` | <pre>[<br/>  "example"<br/>]</pre> | no |
| <a name="input_subnet_tags"></a> [subnet\_tags](#input\_subnet\_tags) | List of tags for each subnet | `list(list(string))` | <pre>[<br/>  [<br/>    "subnet-1"<br/>  ],<br/>  [<br/>    "subnet-2"<br/>  ]<br/>]</pre> | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets | `list(any)` | <pre>[<br/>  {<br/>    "cidr": "10.0.1.0/24",<br/>    "dns_nameservers": [<br/>      "8.8.8.8"<br/>    ],<br/>    "dns_publish_fixed_ip": true,<br/>    "enable_dhcp": true,<br/>    "ip_version": 4,<br/>    "name": "example-subnet-1"<br/>  },<br/>  {<br/>    "cidr": "10.0.2.0/24",<br/>    "dns_nameservers": [<br/>      "8.8.8.8"<br/>    ],<br/>    "enable_dhcp": true,<br/>    "ip_version": 4,<br/>    "name": "example-subnet-2"<br/>  }<br/>]</pre> | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Whether to use name\_prefix before name or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the network |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | The ID of the router |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The subnets of the network |
<!-- END_TF_DOCS -->
