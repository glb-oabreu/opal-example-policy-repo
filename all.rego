package ccx.abacrbac

import ccx.newabac.check_attribute
import ccx.newrbac.check_role

default allow := false

allow {
    check_attribute
}
allow {
    check_role
}