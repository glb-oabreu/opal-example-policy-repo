package ccx.newabac
import rego.v1
import utils.claims
import utils.bearer_token

default validate_caseworker := false

validate_caseworker if {
  not claims.realm_access.roles
  claims.is_caseworker
  claims.is_ecis_internal
}
