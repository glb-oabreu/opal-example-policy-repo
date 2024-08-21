package ccx.allchecks
import rego.v1
import data.ccx.newabac.validate_caseworker
import data.ccx.newrbac.rbac_check

default allow := false

allow := true if {
  rbac_check
} else := true if {
  validate_caseworker
}
