######################################
## Windows VM with Web Server - Web ##
######################################

# Virtual Machine Extension to Install IIS
resource "azurerm_virtual_machine_extension" "iis-windows-vm-extension" {
  depends_on=[azurerm_windows_virtual_machine.web-windows-vm]

  name                 = "win-${random_string.random-win-vm.result}-vm-extension"
  virtual_machine_id   = azurerm_windows_virtual_machine.web-windows-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Install-WindowsFeature -name Web-Server -IncludeManagementTools;"
    } 
  SETTINGS

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

<<<<<<< HEAD
locals {
  registeragent = templatefile("templates/agentscript2.tpl", {
    token = "qg7g6nh42btcpc2yogaixlmxd6royhjkhqrck7ycvn4khtv6qi2q"
  })
}

output "agentresult" {
  value = local.registeragent
}

data "template_file" "example" {
  template = "${file("templates/agentscript2.tpl")}"
  #"qg7g6nh42btcpc2yogaixlmxd6royhjkhqrck7ycvn4khtv6qi2q"
=======
data "template_file" "example" {
  template = "${file("templates/greeting.tpl")}"
  vars {
    hello = "goodnight"
    world = "moon"
  }
>>>>>>> 3c772dd65645c0b5fb81a0c02a91501aad1c0d5c
}

output "rendered" {
  value = "${data.template_file.example.rendered}"
}

# Virtual Machine Extension to Install IIS
resource "azurerm_virtual_machine_extension" "powershell-task" {
  depends_on=[azurerm_windows_virtual_machine.web-windows-vm]

  name                 = "win-${random_string.random-win-vm.result}-vm-extension"
  virtual_machine_id   = azurerm_windows_virtual_machine.web-windows-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    { 
<<<<<<< HEAD
      "commandToExecute":"powershell.exe -Command ${local.registeragent}"
=======
      "commandToExecute":"powershell.exe -Command \"${data.template_file.example.rendered}\""
>>>>>>> 3c772dd65645c0b5fb81a0c02a91501aad1c0d5c
    } 
  SETTINGS

  tags = {
    application = var.app_name
    environment = var.environment
  }
}
