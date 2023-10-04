terraform {
  required_version = ">= 0.12"
  required_providers {
    postgresql = {
        source  = "cyrilgdn/postgresql"
        version = ">= 1.7.1"
    }
  }
}
