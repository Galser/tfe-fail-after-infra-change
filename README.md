# tfe-fail-after-infra-change
Reproduce TFE fail after infra deploy

# Rerpudcing - Quoting customer  

Provisioning Code:
https://github.com/RajkumarRajangam/replicate-error
Module code:
https://github.com/RajkumarRajangam/terraform-tfe-tfe-workspace

## Step 1:

Provisioned a Workspace & it succeeded. No errors occurred. (Commit: https://github.com/RajkumarRajangam/replicate-error/blob/8e6992dd4c094714d22b457aaa19902af27164f9/createws.tf)

## Step 2:

Later I deleted the code(Provider + Module + Variables) for provisioning the workspace, commited the code, which triggered a plan & apply.

Again Plan succeeded without any errors but Apply stage failed with the following error. (Commit : https://github.com/RajkumarRajangam/replicate-error/commit/287bbb1eccb6cf1923f486929974e51755b9e308)

```terraform
Terraform v0.13.5
Initializing plugins and modules...

Error: Could not load plugin

Plugin reinitialization required. Please run "terraform init".

Plugins are external binaries that Terraform uses to access and manipulate
resources. The configuration provided requires plugins which can't be located,
don't satisfy the version constraints, or are otherwise incompatible.

Terraform automatically discovers provider requirements from your
configuration, including providers used in child modules. To see the
requirements and constraints, run "terraform providers".

Failed to instantiate provider "registry.terraform.io/hashicorp/tfe" to obtain
schema: unknown provider "registry.terraform.io/hashicorp/tfe"
```


## Step 3: Resolution

The error was fixed by adding a terraform block with required providers i.e, tfe provider in this case. (Commit: https://github.com/RajkumarRajangam/replicate-error/commit/24f1c06ebf01fb64dd888608a465c0eea7b21130)



# TODO 

- [ ] simplify code
- [ ] test[ (try to fail)
- [ [ report bug

>> ... I don't believe that deleteing code in a way above is normal withtin the TF. But let's test. 
