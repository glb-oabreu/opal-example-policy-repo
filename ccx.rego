package ccx.allchecks

default allow := false

allow {
    regex.match("/anotherthing", input.request.path)
}
