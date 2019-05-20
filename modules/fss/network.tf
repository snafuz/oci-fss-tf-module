
resource "oci_core_subnet" "fss_sub" {
  count                      = "${(var.subnet_id == "") ? 1 : 0}"
  availability_domain        = "${data.oci_identity_availability_domain.ad.name}"
  cidr_block                 = "${local.l_subnet_cidr}"
  compartment_id             = "${var.compartment_id}"
  display_name               = "${var.label_prefix}-mt-sub"
  dns_label                  = "${var.label_prefix}mtsub"
  prohibit_public_ip_on_vnic = true
  route_table_id             = "${var.rt_id}"
  security_list_ids          = ["${oci_core_security_list.fss_sl.id}"]
  vcn_id                     = "${var.vcn_id}"
  
}
