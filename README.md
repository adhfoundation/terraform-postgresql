# Terraform Database Postgresql

Module from the provider [Postgresql](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs) to creation of users, databases and grant access to the new database on existing PostgreSQL.

It's required the [Postgresql Provider](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs).

## Motivation

This module was created to reduce the necessity of creation individual RDS instance for each application. With this module we can reuse the same RDS Instance with many PostgreSQL database inside.

## Usage
```terraform
terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.17.1"
    }
  }
}

provider "postgresql" {
  host              = "localhost"
  port              = 5432
  database          = "main"
  username          = "root"
  password          = "1234root" 
  superuser         = false # Use superuser = false if you are creating a database [on RDS instance](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs#superuser)
  # Others Parameters on [Postgresql](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs)
}

module "terraform-postgresql" {
    source = "git@github.com:iclinic/terraform-postgresql.git?ref=v1.0"
    
    dbname        = "database-name"
    password      = "123456789"
    user          = "user"
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | >= 1.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | >= 1.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [postgresql_database.default](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs/resources/database) | resource |
| [postgresql_grant.default](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs/resources/grant) | resource |
| [postgresql_role.default](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dbname"></a> [dbname](#input\_dbname) | Name to use for the database | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the user | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Name of user to create | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->