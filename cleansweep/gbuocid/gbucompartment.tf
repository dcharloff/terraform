## This configuration was generated by terraform-provider-oci

data oci_identity_compartments tenancycompartments {
  compartment_id = "${var.tenancy_ocid}"
  filter {
    name = "name" 
    values = ["${var.compartment_name}"]
  }
}

#output "tenancycompartments" {
#  description = "compartment" 
#  value = data.oci_identity_compartments.tenancycompartments.compartments[*].id 
#}

#output "tenancycompartmentsn" {
#  description = "compartment" 
#  value = data.oci_identity_compartments.tenancycompartments.compartments[*].name 
#}

output "tenancycompartments" {
  description = "compartment" 
  value = data.oci_identity_compartments.tenancycompartments.compartments[0].id 
}

