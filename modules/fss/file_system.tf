
resource "oci_file_storage_file_system" "fss_fs" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${var.compartment_id}"
  display_name        = "${var.fs_name}"
}
