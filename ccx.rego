package ccx.allchecks

default allow := false

import data.ccx.newabac.check_attribute
import data.ccx.newrbac.check_role


allow {
    check_attribute
}
allow {
    check_role
}
