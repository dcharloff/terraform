#!/bin/bash -ex

echo 'initcompute' 

# obtain the tenancy OCID from the environment in the OIC Cloud Shell 
export TF_VAR_tenancy_ocid=$OCI_TENANCY

# change in to the directory to get the GBU compartment OCID
cd ttt/initcompute/gbuocid

# execute terraform; initialize, apply to retrieve the GBU compartment OCID
terraform init
terraform apply -auto-approve
export TF_VAR_compartment_id=`terraform output tenancycompartments`

# cleanup the temporary terraform directory
rm -rf .terraform

# move up a directory
cd .. 

# cleanup any existing export directory and recreate it
#rm -rf tf-export 
#mkdir tf-export 

# initialize terraform to get the provider
terraform init

# execute the terraform by applying and auto-approve

terraform apply -auto-approve

# find the provider executable and put it in a variable; the export command applies directly to a provider
#export TPO=`find . -name *terraform-provider-oci*.*`

# execute eval for the export, pass in the compartment, and generate a state
#eval $TPO -command=export \
#                         -compartment_id=$TF_VAR_compartment_id \
#                         -output_path=tf-export \
#                         -generate_state

# change into the export directory; the terraform state is there
#cd tf-export

# initialize terraform in this directory, and destroy what was exported in the GBU compartment
#terraform init
#terraform destroy -auto-approve

echo 'initcompute complete'
