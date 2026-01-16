# WiFi Password Exporter for Windows 11

A simple batch script to export all saved WiFi network passwords from Windows 11 to a text file.

## Features

- 📡 Exports all saved WiFi networks and passwords
- 📁 Choose custom output directory or use current directory
- 🔒 Identifies open networks (no password)
- 📊 Displays total count of networks found
- 📝 Generates clean, formatted text output
- ✨ Easy to use - no complex setup required

## Requirements

- Windows 10 or Windows 11
- Administrator privileges (required to access WiFi passwords)

## Installation

1. Download the `WiFi_Export.bat` file
2. Save it to any location on your computer

No installation or additional dependencies required!

## Usage

### Step 1: Run as Administrator

Right-click on `WiFi_Export.bat` and select **"Run as administrator"**

> ⚠️ **Important:** Administrator privileges are required to access stored WiFi passwords. The script will not work without them.

### Step 2: Choose Output Directory

When prompted, you have two options:

**Option A:** Specify a directory path
```
Enter the directory path where you want to save the file
(Press Enter to use current directory: C:\Users\YourName)

Directory path: D:\Backups
```

**Option B:** Use current directory (just press Enter)
```
Enter the directory path where you want to save the file
(Press Enter to use current directory: C:\Users\YourName)

Directory path: [Press Enter]
```

### Step 3: View Results

The script will:
1. Process all saved WiFi networks
2. Display progress in real-time
3. Save results to `WiFi_Passwords.txt`
4. Show summary of total networks found

## Output Format

The generated `WiFi_Passwords.txt` file looks like this:

```
WiFi Networks and Passwords
==================================================
Export Date: 01/17/2026 10:30:45
==================================================

Network Name: HomeNetwork
Password: mypassword123
--------------------------------------------------

Network Name: OfficeWiFi
Password: SecurePass2024
--------------------------------------------------

Network Name: Cafe_Guest
Password: (No password / Open network)
--------------------------------------------------

==================================================
Total Networks Found: 3
==================================================
```

## How It Works

The script uses Windows built-in `netsh` commands to:
1. List all saved WiFi profiles on your system
2. Retrieve the password for each profile
3. Format and export the data to a text file

## Security Notes

🔐 **Keep your output file secure!**

- The exported file contains your WiFi passwords in plain text
- Store it in a secure location
- Delete it after use if you only needed temporary access
- Do not share the file publicly

## Troubleshooting

### "Access Denied" Error
- **Solution:** Make sure you're running the script as administrator

### "Directory does not exist" Error
- **Solution:** The script will attempt to create the directory automatically. If it fails, check that you have write permissions for the specified path.

### No Passwords Found
- **Solution:** You'll only see passwords for networks you've previously connected to on this computer. The passwords must be stored in Windows.

### Script Not Working on Windows 10
- **Solution:** The script works on both Windows 10 and 11, but make sure you have the latest updates installed.

## Use Cases

- 📱 Migrating to a new device
- 🔧 Troubleshooting network issues
- 💾 Backing up network credentials
- 🏢 Documenting office WiFi networks
- 🔄 Recovering forgotten passwords

## Command Reference

The script uses these Windows commands internally:
```batch
netsh wlan show profiles              # Lists all WiFi profiles
netsh wlan show profile name="NAME" key=clear  # Shows password for specific profile
```

## License

This project is free to use and modify. No attribution required.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## Disclaimer

This tool is intended for legitimate use only - to recover your own WiFi passwords on your own devices. Unauthorized access to networks is illegal. Use responsibly.

## Author

Created for easy WiFi password management on Windows systems.

---

⭐ If you found this helpful, please consider giving it a star on GitHub!

## FAQ

**Q: Will this work on Windows 7 or 8?**  
A: It should work on Windows 7 and later, though it's primarily tested on Windows 10/11.

**Q: Can I export passwords from someone else's computer?**  
A: You can only export passwords that are saved on the computer you're running the script on. You need administrator access to that computer.

**Q: Why do I need administrator privileges?**  
A: Windows stores WiFi passwords in a protected area that requires elevated permissions to access, for security reasons.

**Q: Can this hack WiFi passwords?**  
A: No. This only retrieves passwords that are already saved on your computer. It cannot crack or hack passwords for networks you haven't connected to.

**Q: Is my data sent anywhere?**  
A: No. This script runs entirely locally on your computer. No data is sent to any server or external location.