package ccx.newabac
import rego.v1
import data.utils.claims
import data.utils.bearer_token

default validate_caseworker := false

default mtest := false

mtest := true if claims.is_caseworker

validate_caseworker if {
  not claims.realm_access.roles
  claims.is_caseworker
  claims.is_ecis_internal
}
