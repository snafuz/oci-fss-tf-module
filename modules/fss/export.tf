resource "oci_file_storage_export_set" "fss_export_set" {
  mount_target_id = "${oci_file_storage_mount_target.fss_mt.id}"
  display_name      = "${var.export_set_desc}"
  max_fs_stat_bytes = "${var.max_byte}"
  max_fs_stat_files = "${var.max_files}"
}

resource "oci_file_storage_export" "fss_export" {
  count = 0
  export_set_id  = "${oci_file_storage_export_set.fss_export_set.id}"
  file_system_id = "${oci_file_storage_file_system.fss_fs.id}"
  path           = "${local.l_export_path}"

  export_options = [
    {
      source                         = "${local.l_export_rw_src}"
      access                         = "READ_WRITE"
      identity_squash                = "NONE"
      require_privileged_source_port = true
    },
    {
      source                         = "${var.export_ro_src}"
      access                         = "READ_ONLY"
      identity_squash                = "ALL"
      require_privileged_source_port = true
    },
  ]
}
