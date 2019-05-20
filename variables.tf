#identity
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "api_fingerprint" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_private_key_path" {}
variable "ssh_public_key_path" {}
variable "api_private_key_path" {}

#network
variable "vcn_id" {}
variable "rt_id" {}

variable "subnet_cidr" {
    default = ""
}



