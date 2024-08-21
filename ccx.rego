package ccx.allchecks
import rego.v1
import data.ccx.newabac.validate_caseworker

default allow := false

allow := true if {
  validate_caseworker
} else := true if {
  regex.match("/get", input.request.path)
}
