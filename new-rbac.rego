package ccx.newrbac

import rego.v1

import data.utils.claims
import data.utils.split_content

default rbac_check := false

rbac_check if allowed_action

role_permissions(role_name) := [permission |
	some permission in data.external.uam
	permission.role_name == role_name
]

scalar_resource_permission := [permission |
	some role in claims.realm_access.roles
	some permission in role_permissions(role)
	resources := split_content(permission.uri, ",")
	input.request.path in resources
]

id_resource_permission := [{"1": permission, "2": exp} |
	some role in claims.realm_access.roles
	some permission in role_permissions(role)
	resources := split_content(permission.uri, ",")
	some resource in resources
	contains(resource, "{")
	replaced := regex.replace(resource, `{\w+}`, "([^/]+)")
        exp := concat("",[replaced, "$"])
	regex.match(exp, input.request.path)
]

matched_permissions := scalar_resource_permission if {
	count(scalar_resource_permission) > 0
} else := id_resource_permission if {
	count(id_resource_permission) > 0
}

allowed_action if {
	some p in matched_permissions
	input.request.method in split_content(p.action, ",")
}
