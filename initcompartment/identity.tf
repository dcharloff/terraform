## This configuration was generated by terraform-provider-oci

#data "oci_tenancy" {
#    tenancy_ocid="${var.tenancy_ocid}"
#}

data oci_identity_identity_providers OracleIdentityCloudService {
  compartment_id      = "${var.tenancy_ocid}"
  protocol            = "SAML2"
}

resource oci_identity_compartment newcompartment {
  compartment_id       = "${var.tenancy_ocid}"
  description          = "${var.compartment_name}"
  name                 = "${var.compartment_name}"
}

resource oci_identity_group newidentitygroup {
  compartment_id       = "${var.tenancy_ocid}"
  description          = "${var.compartment_name}"
  freeform_tags        = {}
  name                 = "${var.compartment_name}"
}

resource oci_identity_idp_group_mapping OracleIdentityCloudService_idp_group_mapping_new {
  group_id             = "${oci_identity_group.newidentitygroup.id}"
  identity_provider_id = "${data.oci_identity_identity_providers.OracleIdentityCloudService.identity_providers[0].id}"
  idp_group_name       = "${var.compartment_name}"
  depends_on           = [oci_identity_compartment.newcompartment]
}

resource oci_identity_policy new_Policy {
  compartment_id       = "${var.tenancy_ocid}"
  #"${oci_identity_compartment.newcompartment.id}"
  description          = "${var.compartment_name}_Policy"
  freeform_tags        = { }
  name                 = "${var.compartment_name}_Policy"
  statements           = [
    "allow group ${var.compartment_name} to manage all-resources in compartment ${var.compartment_name}",
    "allow group ${var.compartment_name} to use tag-namespaces in tenancy",
    "allow group ${var.compartment_name} to manage repos in tenancy",
    "allow group ${var.compartment_name} to manage instances in compartment ${var.compartment_name}",
    "allow group ${var.compartment_name} to use instances in compartment ${var.compartment_name}"
  ]
  depends_on           = [oci_identity_compartment.newcompartment]
}

#resource oci_identity_policy TIMS-oSSH-Users-new {
#  compartment_id       = var.tenancy_ocid
#  description          = "TIMS-oSSH-Users-${var.compartment_name}"
#  freeform_tags        = {  }
#  name                 = "TIMS-oSSH-Users-${var.compartment_name}"
#  statements           = [
#    "allow group ${var.compartment_name} to manage instances in compartment ${var.compartment_name}",
#    "allow group ${var.compartment_name} to use instances in compartment ${var.compartment_name}"
#  ]
#  depends_on           = [oci_identity_compartment.newcompartment]
#}

output "oci_identity_policy" {
  description = "New TIMS-oSSH-Users Policy"
  value = oci_identity_policy.TIMS-oSSH-Users-new.id
  #value = oci_identity_policy.TIMS-oSSH.id
}

output "oci_identity_compartment" {
  description = "compartment" 
  value = oci_identity_compartment.newcompartment.id 
}

output "oci_identity_identity_provider" {
  description = "idp"
  value = data.oci_identity_identity_providers.OracleIdentityCloudService.identity_providers[0].id  
  #value = data.oci_identity_identity_providers.OracleIdentityCloudService.name
}


