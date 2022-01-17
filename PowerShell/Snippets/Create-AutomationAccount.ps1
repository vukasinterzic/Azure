#Create an Azure Automation Account with PowerShell:

$automationAccount = @{
    Name = "MyAutomationAccount";
    ResourceGroupName = "MyResourceGroup";
    Location = "westus2";
    Tags = @{
        "Environment" = "Test";
        "Project" = "BlogPost";
    };
}

New-AzAutomationAccount @automationAccount -AssignSystemIdentity