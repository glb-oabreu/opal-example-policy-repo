package ccx.newabac

default allow := false

allow {
	regex.match("/anything", input.request.path)
}