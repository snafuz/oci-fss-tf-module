resource "oci_core_security_list" "fss_sl" {
  compartment_id = "${var.compartment_id}"
  display_name   = "fss-sl"
  vcn_id         = "${var.vcn_id}"

  // Allow  outbound requests
  egress_security_rules = [
    {
      destination = "0.0.0.0/0"
      protocol    = "all"
    },
  ]
 ingress_security_rules = [
    {
      protocol = "6"
      source   = "${data.oci_core_vcn.vcn.cidr_block}"

      tcp_options {
        "min" = 2048
        "max" = 2050
      }
    },
    {
      protocol = "6"
      source   = "${data.oci_core_vcn.vcn.cidr_block}"

      tcp_options {
        source_port_range {
          "min" = 2048
          "max" = 2050
        }
      }
    },
    {
      protocol = "6"
      source   = "${data.oci_core_vcn.vcn.cidr_block}"

      tcp_options {
        "min" = 111
        "max" = 111
      }
    },
  ]
}
