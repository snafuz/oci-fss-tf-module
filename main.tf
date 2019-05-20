module "fss" {
  source = "./modules/fss"

  # identity 
  tenancy_id        = "${var.tenancy_ocid}"
  compartment_id    = "${var.compartment_ocid}"
  
  
  #network
  vcn_id            = "${var.vcn_id}"
  rt_id             = "${var.rt_id}"
  subnet_newbits    = 13
  subnet_cidr       = "${var.subnet_cidr}"


}

output "fss-details" {
  value = "${module.fss.fss_details}"
}

