resource "postgresql_database" "default"{
  name = var.dbname
  allow_connections = true
}

resource "postgresql_role" "default"{
  name = var.username
  login = true
  password = var.password
}

resource "postgresql_grant" "default"{
  role = postgresql_role.default.name
  database = postgresql_database.default.name
  object_type = "database"
  privileges = ["ALL"]
}