import subprocess

# Path to your PowerShell script
script_path = r"C:\Users\hp\Desktop\Audit Modules\Firewall Private.ps1"

# Run the PowerShell script using subprocess
result = subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", script_path], capture_output=True, text=True)

# Output the results
print("Output:")
print(result.stdout)

print("Error (if any):")
print(result.stderr)
