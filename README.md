## Deploy OCI File Storage Service (FSS) resources
This module creates file system and mount target in a given VCN. 
If Subnet OCID is not supplied it also creates a /29 subnet dedicated to the mount target

### Usage
Update `terraform.tfvars` with the required information. 
Then initialize terraform and run plan/apply

```Bash
    cp terraform.tfvars.template terraform.tfvars
    # Update the file with your configuration
    # ...

    # initialize terraform
    terraform init

    # verifiy your configuration
    terraform plan

    #apply the configuration
    terraform apply

```

