
output "fss_details" {
    value = "${map(
        "mount point", "${local.mt_ip}",
        "subnet cidr", "${oci_core_subnet.fss_sub.*.cidr_block[0]}",
        "export path", "${local.l_export_path}",
    )}"
}