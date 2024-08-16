package ccx.newabac

default check_attribute := false

check_attribute {
	regex.match("/anything", input.request.path)
}