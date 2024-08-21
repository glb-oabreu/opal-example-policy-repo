package ccx.allchecks
import rego.v1
import data.ccx.newabac.validate_caseworker

default allow := false

allow if validate_caseworker
