package ccx.allchecks
import rego.v1
import data.ccx.newabac.validate_caseworker
import data.ccx.newabac.mtest



default allow := false

allow if validate_caseworker
allow if mtest
