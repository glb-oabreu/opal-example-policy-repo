package ccx.newrbac

default check_role := false

check_role {
	regex.match("/anythingelse", input.request.path)
}