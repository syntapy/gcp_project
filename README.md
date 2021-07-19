Terraform module to create a project

Needs an organization level account (google workspace account) and works with the following roles assigned to the account terraform uses (`gcloud auth application-default login`)
 - roles/billing.creator
 - roles/resourcemanager.organizationAdmin
 - roles/resourcemanager.projectCreator
 - roles/storage.admin
