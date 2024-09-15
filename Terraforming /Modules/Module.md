# Terraform Modules

## Table of Contents
1. [Introduction](#introduction)
2. [Creating Modules](#creating-modules)
3. [Using Modules](#using-modules)
4. [Module Structure](#module-structure)
5. [Input Variables](#input-variables)
6. [Output Values](#output-values)
7. [Module Versioning](#module-versioning)
8. [Module Registry](#module-registry)
9. [Examples](#examples)
10. [Best Practices](#best-practices)
11. [References](#references)

## Introduction
Modules in Terraform are self-contained packages of Terraform configurations that are managed as a group. They enable you to encapsulate and reuse configurations, making your infrastructure code more modular, maintainable, and scalable.

## Creating Modules
A module is simply a directory containing `.tf` files. To create a module, you need to:
1. Create a new directory for the module.
2. Add your Terraform configuration files (`.tf`) to this directory.

Example:
```
my-module/
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
```

## Using Modules
To use a module, you need to reference it in your Terraform configuration using the `module` block.

Example:
```hcl
module "my_module" {
  source = "./path/to/my-module"
  variable_name = "value"
}
```

## Module Structure
A typical module structure includes:
- `main.tf`: Contains the main resources and configurations.
- `variables.tf`: Defines input variables for the module.
- `outputs.tf`: Defines output values for the module.

Example:
```hcl
# main.tf
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}

# variables.tf
variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

# outputs.tf
output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.example.id
}
```

## Input Variables
Modules can accept input variables to customize their behavior. Input variables are defined using the `variable` block.

Example:
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}
```

## Output Values
Modules can return output values to expose information to the calling module. Output values are defined using the `output` block.

Example:
```hcl
output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.example.id
}
```

## Module Versioning
When using modules from a remote source, such as the Terraform Registry, you can specify a version to ensure consistency.

Example:
```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"
}
```

## Module Registry
The Terraform Registry is a public repository of Terraform modules. You can find and use modules from the registry to simplify your infrastructure code.

Example:
```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"
}
```

## Examples
### Basic Module Usage
```hcl
module "my_module" {
  source = "./path/to/my-module"
  ami    = "ami-0c55b159cbfafe1f0"
}
```

### Using a Module from the Terraform Registry
```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"
}
```

## Best Practices
- **Use Descriptive Names**: Choose meaningful names for your modules to make your configurations easier to understand.
- **Provide Documentation**: Include a README file in your module directory to explain its purpose and usage.
- **Version Control**: Use versioning for your modules to ensure consistency and manage updates.
- **Keep Modules Simple**: Aim to keep your modules focused and simple to promote reusability.
- **Use Input Validation**: Validate input variables to ensure they meet expected criteria.

## References
- [Terraform Documentation: Modules](https://www.terraform.io/docs/language/modules/index.html)
- [Terraform Best Practices](https://www.terraform.io/docs/language/best-practices/index.html)
- [HashiCorp Learn: Modules](https://learn.hashicorp.com/collections/terraform/modules)
- [Terraform Registry](https://registry.terraform.io/)

---

This README provides a detailed overview of modules in Terraform, covering their creation, usage, structure, and best practices.