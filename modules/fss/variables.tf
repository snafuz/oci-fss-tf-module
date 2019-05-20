#identity
variable "compartment_id" {}
variable "tenancy_id" {}
variable "rt_id" {}
variable "label_prefix" {
  default = "fss"
}


#network
variable "vcn_id" {
  description = "VCN OCID"
  default = ""
}

variable "subnet_newbits" {
  description = "Subnet newbits"
  default = 13
}
variable "subnet_id" {
  description = "Subnet OCID"
  default = ""
}
variable "subnet_cidr"{
  default = ""
}
variable "ad" {
  description = "Availability Domain number"
  default = "1"
}

# fss
variable "fs_name" {
  description = "File System Name"
  default = "fs"
}

variable "mt_name" {
  description = "Mount Target Name"
  default = "mt"
}


variable "export_path" {
  default = ""
}

variable "export_set_desc" {
  default = "export set for mount target"
}

variable "max_byte" {
  default = 23843202333
}

variable "max_files" {
  default = 223442
}

variable "export_rw_src" {
  default = ""
}

variable "export_ro_src" {
  default = "0.0.0.0/0"
}


locals {
  l_subnet_cidr = "${var.subnet_cidr == "" ? cidrsubnet(data.oci_core_vcn.vcn.cidr_block,var.subnet_newbits,1) : var.subnet_cidr}"
  l_export_path = "${var.export_path == "" ?  "/fspaths/${var.fs_name}" : var.export_path}"
  l_export_rw_src = "${var.export_rw_src == "" ? data.oci_core_vcn.vcn.cidr_block : var.subnet_cidr}"
  mt_ip = "${lookup(data.oci_core_private_ips.ip_fss_mt.private_ips[0], "ip_address")}"
}



