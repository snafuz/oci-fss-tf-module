data "oci_core_vcn" "vcn" {
    vcn_id = "${var.vcn_id}"
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = "${var.tenancy_id}"
  ad_number      = "${var.ad}"
}

data "oci_core_private_ips" ip_fss_mt {
   subnet_id = "${oci_file_storage_mount_target.fss_mt.subnet_id}"

   filter {
     name   = "id"
     values = ["${oci_file_storage_mount_target.fss_mt.private_ip_ids.0}"]
   }
 }
