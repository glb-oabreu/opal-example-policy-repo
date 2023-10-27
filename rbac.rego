package rbacpol

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# By default, deny requests.
default allow := false

allow {
	re_match("/users/anonymous", input.resource)
}

allow {
	re_match("/actuator/health", input.resource)
}

allow {
	re_match("/actuator/info", input.resource)
}

allow {
	re_match("/actuator/gateway/*", input.resource)
}

# Allow the action if the user is granted permission to perform the action.
allow if {
	some policy in user_policies
	input.request.method == policy.action
	input.request.path == policy.resource
}

my_users contains r if {
	some usr in data.users
	some r in usr.roles
}

user_policies contains policy if {
	some role in data.users[token.preferred_username].roles 
	some policy in data.policies
	policy.role == role
}

token := payload if {
	[_, payload, _] := io.jwt.decode(bearer_token)
}

bearer_token := t if {
	# Bearer tokens are contained inside of the HTTP Authorization header. This rule
	# parses the header and extracts the Bearer token value. If no Bearer token is
	# provided, the `bearer_token` value is undefined.
	v := input.request.headers.Authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}
