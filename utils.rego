package utils
import rego.v1

split_content(content, delimiter) := {x | x := split(content, delimiter)[_]}

claims := payload if {
	[_, payload, _] := io.jwt.decode(bearer_token)
}

bearer_token := t if {
	v := input.request.headers.authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}
