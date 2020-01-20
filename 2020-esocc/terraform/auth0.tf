provider "auth0" {
  domain = var.domain
  client_id = var.client_id
  client_secret = var.client_secret
}

variable "domain" {
  default = "example.test"
}

variable "client_id" {
  default = "abc"
}

variable "client_secret" {
  default = "xyz123abc"
}

resource "auth0_resource_server" "auth_resource_server" {
  name        = "auth_resource_server"
  identifier  = "https://api.example.test"
  signing_alg = "RS256"
  scopes {
    value = "user"
  }
  scopes {
    value = "admin"
  }
  allow_offline_access = true
  token_lifetime = 8600
  skip_consent_for_verifiable_first_party_clients = true
}


