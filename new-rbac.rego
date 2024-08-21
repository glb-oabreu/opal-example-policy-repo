package ccx.newrbac
import rego.v1
import data.utils.claims

default rbac_check := false

rbac_check if allowed_actions.action == "ALL"
rbac_check if regex.match(input.request.method, allowed_actions.action)

role_permissions[role_name] := p if {
	some i
	startswith(input.request.path, data.external.uam[i].uri)
	role_name := data.external.uam[i].role_name
	p := data.external.uam[i]
}

allowed_actions := actions if {
	some role in claims.realm_access.roles
	actions := role_permissions[role]
}
