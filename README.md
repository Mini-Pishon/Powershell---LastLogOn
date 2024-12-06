# Last Logon Date Retrieval Script for Active Directory

This PowerShell script is designed to retrieve the last logon date of a specific user from all Domain Controllers (DC) in an Active Directory (AD) environment. It queries each DC for the user's `lastLogon` attribute and ensures that the most recent logon date is returned.

## Requirements

- PowerShell (version 5.1 or later)
- Active Directory module for PowerShell (included in Windows Server or via RSAT on Windows 10/11)
- Administrator privileges to access Active Directory and query Domain Controllers.

## How It Works

1. The script queries all Domain Controllers in the AD domain.
2. It retrieves the `lastLogon` attribute for the specified user from each Domain Controller.
3. The `lastLogon` values are compared, and the most recent one is stored and displayed.
4. The script works by querying each Domain Controller in turn and ensuring the most up-to-date logon information is retrieved.

## Usage

### Prerequisites:
Ensure you have the **Active Directory module for PowerShell** installed and configured on your machine.

### Script Setup:

1. Clone this repository or download the PowerShell script to your machine.
2. Open the script in PowerShell ISE or your preferred editor.

### Running the Script:

1. Open **PowerShell** as an Administrator.
2. Navigate to the directory where the script is located.
3. Modify the script to specify the **target user** (update the `$TargetUser` variable with the user's SamAccountName).
4. Run the script using:
    ```powershell
    .\Get-LastLogon.ps1
    ```

### Example:

```powershell
# Modify the target user (SamAccountName)
$TargetUser = "admin.fb"

# Run the script to get the last logon date of the specified user
.\Get-LastLogon.ps1
