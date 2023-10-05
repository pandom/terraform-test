# valid_string_concat.tftest.hcl

variables {
  #appid = "12345"
  appid = "tfteststoraccount"
  prefix = "12345-"
}

provider "azurerm" {
  features {
  }
    // tenant_id = "237fbc04-c52a-458b-af97-eaf7157c0cd4"
    // #burkey_test
    // subscription_id = "61bab92b-3fa8-441c-b6d1-a4e9ad1dd655"
    // skip_provider_registration = true

}

run "storage_account_tests" {
  command = plan

  assert {
    condition = azurerm_storage_account.this.name == var.appid
    error_message = "storage account did not match expected value"
  }

  assert {
    condition = azurerm_storage_account.this.enable_https_traffic_only == true
    error_message = "storage account did not match HTTPS "
  }
  assert {
    condition = azurerm_storage_account.this.sftp_enabled == false
    error_message = "sftp status did not match expected value"
  }
}

