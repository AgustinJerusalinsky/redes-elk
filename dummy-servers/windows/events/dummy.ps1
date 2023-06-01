# Create the event if it doesn't exist
if (!(Get-EventLog -LogName "Windows PowerShell" -Source "DummySource" -ErrorAction SilentlyContinue)) {
    New-EventLog -LogName "Windows PowerShell" -Source "DummySource"
}
# Generate a dummy event in the Windows PowerShell Event Log
Write-EventLog -LogName "Windows PowerShell" -Source "DummySource" -EventId 999 -Message "This is a test event from the dummy script."