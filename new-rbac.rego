package ccx.newrbac

default allow := false

allow {
	regex.match("/anythingelse", input.request.path)
}