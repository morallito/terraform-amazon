terraform {
    backend "s3" {
         bucket = "my-tf-state-bucket-gzqndwah"
         key = "global/state/terraform.tfstate" 
         region = "us-east-2"
         dynamodb_table = "terraform-up-and-running-oepdubkn"
         encrypt = true 
         access_key = "TOREPLACE"
         secret_key = "TOREPLACE"
     }

}