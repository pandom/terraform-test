variables {
  appid = "12345"
  prefix = "12345-"
}

run "resource_group_tests" {

    command = plan
    # example of variable override.
    variables {
        appid = "tf_test_resource_group"
    }
    assert {
        condition = endswith(azurerm_resource_group.this.name, var.appid)
        error_message = "resource group did not match expected value"
    }

    assert {
        condition     = startswith(azurerm_resource_group.this.name, var.prefix)
        error_message = "resource_group name prefix does not match expected."
    }

  
}