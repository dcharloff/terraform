## This configuration was generated by terraform-provider-oci

resource oci_identity_compartment GBU {
  description = "GBU"
  freeform_tags = {
  }
  name = "GBU"
}

resource oci_identity_dynamic_group TIMS-oSSH {
  description = "TIMS-oSSH"
  freeform_tags = {
  }
  matching_rule = "any {instance.compartment.id = /*/}"
  name          = "TIMS-oSSH"
}

resource oci_identity_group GBU {
  description = "GBU"
  freeform_tags = {
  }
  name = "GBU"
}


resource oci_identity_idp_group_mapping export_OracleIdentityCloudService_idp_group_mapping_7 {
  group_id             = oci_identity_group.GBU.id
  identity_provider_id = oci_identity_identity_provider.export_OracleIdentityCloudService.id
  idp_group_name       = "GBU"
}

resource oci_identity_policy GBU_Policy {
  description = "GBU_Policy"
  freeform_tags = {
  }
  name = "GBU_Policy"
  statements = [
    "allow group GBU to manage all-resources in compartment GBU",
    "allow group GBU to use tag-namespaces in tenancy",
    "allow group GBU to manage repos in tenancy",
  ]
}

resource oci_identity_policy TIMS-oSSH {
  description = "TIMS-oSSH"
  freeform_tags = {
  }
  name = "TIMS-oSSH"
  statements = [
    "allow dynamic-group TIMS-oSSH to inspect users in tenancy",
    "allow dynamic-group TIMS-oSSH to inspect groups in tenancy",
    "allow dynamic-group TIMS-oSSH to inspect identity-providers in tenancy",
  ]
}
resource oci_identity_policy TIMS-oSSH-Users {
  description = "TIMS-oSSH-Users"
  freeform_tags = {
  }
  name = "TIMS-oSSH-Users"
  statements = [
    "allow group GBU to manage instances in compartment GBU",
    "allow group GBU to use instances in compartment GBU",
  ]
}
