##
# terraform-kvm-vm
#
# @file
# @version 0.1
SEMTAG=tools/semtag

scope ?= "patch"

.PHONY: release

release:
	$(SEMTAG) beta -s $(scope)


# end
