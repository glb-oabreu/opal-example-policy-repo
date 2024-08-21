package ccx.newabac
import data.utils.claims

default validate_caseworker := false

validate_caseworker if {
  not claims.realm_access.roles
  claims.is_caseworker
  claims.is_ecis_internal
}
