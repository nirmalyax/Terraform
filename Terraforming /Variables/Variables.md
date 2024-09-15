# Terraform Variables

## Table of Contents
1. [Introduction](#introduction)
2. [Defining Variables](#defining-variables)
3. [Variable Types](#variable-types)
4. [Providing Values](#providing-values)
5. [Default Values](#default-values)
6. [Validation](#validation)
7. [Sensitive Variables](#sensitive-variables)
8. [Variable Files](#variable-files)
9. [Examples](#examples)
10. [Best Practices](#best-practices)
11. [References](#references)

## Introduction
Variables in Terraform allow you to parameterize your configurations, making them more flexible and reusable. They enable you to pass dynamic values to your Terraform modules and configurations.

## Defining Variables
Variables are defined using the `variable` block in a `.tf` file. Each variable block includes a name and optional parameters such as type, description, and default value.

Example:
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}
```

## Variable Types
Terraform supports several variable types:
- **string**: A single string value.
- **number**: A numeric value.
- **bool**: A boolean value (true or false).
- **list(type)**: A list of values of a specified type.
- **map(type)**: A map of key-value pairs of a specified type.
- **object({attribute1=type1, attribute2=type2, ...})**: A collection of named attributes with specified types.
- **tuple([type1, type2, ...])**: A sequence of values with specified types.

Example:
```hcl
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
```

## Providing Values
Values for variables can be provided in several ways:
1. **Command-line flags**:
   ```sh
   terraform apply -var="instance_type=t2.large"
   ```
2. **Environment variables**:
   ```sh
   export TF_VAR_instance_type=t2.large
   terraform apply
   ```
3. **Variable files** (`.tfvars`):
   ```hcl
   instance_type = "t2.large"
   ```
   Use the `-var-file` flag to specify a variable file:
   ```sh
   terraform apply -var-file="variables.tfvars"
   ```

## Default Values
Variables can have default values, which are used if no other value is provided.

Example:
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}
```

## Validation
You can add validation rules to variables to ensure they meet certain criteria.

Example:
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be one of t2.micro, t2.small, or t2.medium."
  }
}
```

## Sensitive Variables
Mark variables as sensitive to prevent their values from being displayed in logs or output.

Example:
```hcl
variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
}
```

## Variable Files
Variable files (`.tfvars`) allow you to define values for multiple variables in a single file.

Example (`variables.tfvars`):
```hcl
instance_type = "t2.large"
availability_zones = ["us-west-2a", "us-west-2b"]
```

## Examples
### Basic Variable Usage
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}
```

### Using Lists and Maps
```hcl
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to assign to the instance"
  type        = map(string)
}

resource "aws_instance" "example" {
  ami               = "ami-0c55b159cbfafe1f0"
  instance_type     = "t2.micro"
  availability_zone = var.availability_zones[0]
  tags              = var.tags
}
```

## Best Practices
- **Use Descriptive Names**: Choose meaningful names for your variables to make your configurations easier to understand.
- **Provide Descriptions**: Always include descriptions for your variables to explain their purpose.
- **Use Default Values**: Provide default values for variables when appropriate to simplify usage.
- **Validate Inputs**: Use validation rules to ensure variable values meet expected criteria.
- **Keep Sensitive Data Secure**: Mark sensitive variables as `sensitive` to prevent accidental exposure.

## References
- [Terraform Documentation: Input Variables](https://www.terraform.io/docs/language/values/variables.html)
- [Terraform Best Practices](https://www.terraform.io/docs/language/best-practices/index.html)
- [HashiCorp Learn: Variables](https://learn.hashicorp.com/collections/terraform/variables)

---

This README provides a detailed overview of variables in Terraform, covering their definition, types, usage, and best practices.