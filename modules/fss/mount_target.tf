resource "oci_file_storage_mount_target" "fss_mt" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${var.compartment_id}"
  subnet_id           = "${var.subnet_id=="" ? element(concat(oci_core_subnet.fss_sub.*.id,list("none")),0) : var.subnet_id}"
  display_name        = "${var.mt_name}"
}

