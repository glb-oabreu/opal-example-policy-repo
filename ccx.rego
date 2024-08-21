package ccx.allchecks
import rego.v1

default allow := false

claims := payload if {
	io.jwt.verify_hs256(bearer_token, "B41BD5F462719C6D6118E673A2389")
	[_, payload, _] := io.jwt.decode(bearer_token)
}

bearer_token := t if {
	v := input.request.headers.authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}
