# Mobile Custom API Routes For App


# Deeplink Support
## Option 1: Manually Create the .well-known Directory (For Deeplink Support)
* Steps:

- Access your server via SFTP or your hosting control panel's File Manager.

- Navigate to the root directory of your WordPress installation (commonly public_html).

- Create a new folder named .well-known.

- Upload your required files (e.g., assetlinks.json, apple-app-site-association) into this directory.

- Note: Ensure that your server is configured to serve files from hidden directories. If not, you might need to adjust server settings or contact your hosting provider for assistance.