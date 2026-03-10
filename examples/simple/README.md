# Simple Example

This example demonstrates how to create a basic network using the `terraform-openstack-network-module`.

It creates a network with a single subnet and disabled router.

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
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | >= 3.2.0 |

## Resources

| Name | Type |
|------|------|
| [openstack_networking_port_v2.port_subnet_0](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_port_v2.port_subnet_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | n/a |
| <a name="output_number_of_subnets"></a> [number\_of\_subnets](#output\_number\_of\_subnets) | n/a |
| <a name="output_subnet_1_id"></a> [subnet\_1\_id](#output\_subnet\_1\_id) | n/a |
<!-- END_TF_DOCS -->
