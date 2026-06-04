# Documentation for Speedtest Tracker Add-on

## Overview

This Home Assistant add-on runs Speedtest Tracker in a Docker container, making it easy to monitor your internet connection performance directly from Home Assistant.

## Prerequisites

- Home Assistant OS or Home Assistant Supervised installation
- At least 500MB of free storage for add-on and data
- 1GB+ of available RAM recommended
- Network connectivity to the internet (for speed tests)

## Installation Steps

### Step 1: Add Repository

1. In Home Assistant, navigate to **Settings → Add-ons & Automations → Add-ons → Add-on Store**
2. Click the menu icon (⋮) in the top right
3. Select **Repositories**
4. Enter the repository URL: `https://github.com/iNoels/hassio-speedtest-tracker`
5. Click **Create**
6. Close the dialog

### Step 2: Install Add-on

1. The new repository should appear in your add-ons list
2. Find "Speedtest Tracker" and click it
3. Click the **Install** button
4. Wait for the installation to complete (this may take a few minutes)

### Step 3: Start the Add-on

1. Once installed, click the **Start** button
2. Wait for the startup process to complete (check the **Logs** tab)
3. The add-on is ready when it shows "Speedtest Tracker started successfully"

### Step 4: Access the Web Interface

1. After the add-on is running, click **Open Web UI**
2. Or manually navigate to: `http://homeassistant.local:8000`
3. You should see the Speedtest Tracker login page

## Configuration

### Basic Configuration

The add-on works with default settings out of the box. To customize:

1. Go to the add-on's **Configuration** tab
2. Adjust the following options:

#### App Port
- **Default**: `8000`
- **Range**: 1-65535
- Change this if port 8000 is already in use

#### App Key Length
- **Default**: `32`
- **Range**: 16-128
- Encryption key length for the application
- Increase for better security

#### Log Level
- **Default**: `info`
- **Options**: `debug`, `info`, `notice`, `warning`
- Set to `debug` for troubleshooting

### Environment Variables

You can also set environment variables in the Docker container via `addon.yaml` modifications.

## First-Time Setup

### 1. Initial Login

When you first access Speedtest Tracker, you may need to set up an admin account or log in with default credentials.

### 2. Configure Speedtest Provider

1. Go to **Settings** or **Configuration**
2. Select your speedtest provider (Ookla Speedtest, Speedtest CLI, etc.)
3. Configure any required settings (API keys, authentication)

### 3. Schedule Speed Tests

1. Set up a schedule for automatic speed tests
2. Options typically include:
   - **Interval**: How often to run tests (hourly, daily, weekly, etc.)
   - **Time**: When to run tests
   - **Multiple tests per interval**: Run more than one test per scheduled interval

### 4. Configure Notifications (Optional)

Set up notifications for when:
- Speed drops below a threshold
- Tests fail
- Critical issues occur

## Usage Examples

### Monitoring Internet Speed

1. Open the Speedtest Tracker dashboard
2. View real-time and historical speed metrics
3. Charts show speed trends over time

### Exporting Data

Many versions of Speedtest Tracker allow you to export data for analysis:
1. Go to **Data** or **Export**
2. Choose your format (CSV, JSON, etc.)
3. Download the file

## Troubleshooting

### Issue: Add-on won't start

**Solutions:**
1. Check the **Logs** tab for specific error messages
2. Ensure you have enough free disk space
3. Check that Home Assistant has internet connectivity
4. Try restarting Home Assistant

### Issue: Can't access the web interface

**Solutions:**
1. Verify the add-on is running (green **Start** button)
2. Check your home network IP and ensure you're on the right subnet
3. Try accessing via IP address instead of hostname:
   ```
   http://<your-home-assistant-ip>:8000
   ```
4. Verify port 8000 isn't blocked by firewall

### Issue: Speed tests aren't running

**Solutions:**
1. Check Speedtest Tracker settings for schedule configuration
2. Verify internet connectivity from Home Assistant
3. Check if the speedtest provider API is working
4. Look for errors in the **Logs** tab

### Issue: Data not persisting

**Solutions:**
1. Verify `/config/` has sufficient free space
2. Check add-on logs for permission errors
3. Ensure the add-on has write permissions to `/config/`

## Performance Considerations

- **CPU**: Speed tests can be CPU-intensive; on slower hardware, you might want to limit test frequency
- **Network**: Speed tests use your internet bandwidth; schedule tests during off-peak hours
- **Storage**: Data accumulates over time; budget ~10-50MB per month depending on test frequency

## Security

### Default Ports

The add-on uses port `8000` by default. If you need to change it:
1. Edit the **Configuration** tab
2. Change the `app_port` value
3. Restart the add-on

### API Access

If Speedtest Tracker exposes an API:
- Be careful sharing API endpoints or tokens
- Don't expose your instance to the public internet without authentication
- Use strong passwords/API keys

## Advanced Configuration

### Using Custom Speedtest Provider

Some versions allow custom providers. Check the Speedtest Tracker documentation for:
- API key configuration
- Custom endpoint setup
- Provider-specific options

### Backup and Restore

To backup your Speedtest Tracker data:

```bash
# SSH to Home Assistant host
cd /mnt/data/supervisor/homeassistant/
tar -czf speedtest-tracker-backup.tar.gz speedtest-tracker/
```

To restore:

```bash
tar -xzf speedtest-tracker-backup.tar.gz
```

## Additional Resources

- **Speedtest Tracker GitHub**: https://github.com/alexjustesen/speedtest-tracker
- **Speedtest Tracker Docs**: https://docs.speedtest-tracker.dev/
- **Home Assistant Add-ons Docs**: https://developers.home-assistant.io/docs/add-ons
- **LinuxServer.io Image**: https://hub.docker.com/r/linuxserver/speedtest-tracker

## FAQ

**Q: Can I run multiple Speedtest Tracker instances?**
A: Not with this add-on (one per Home Assistant instance). For multiple instances, run additional Docker containers separately.

**Q: Will this affect my internet speed?**
A: Speed tests will consume bandwidth during test runs, but shouldn't affect normal internet usage otherwise.

**Q: How much storage does Speedtest Tracker use?**
A: Depends on test frequency and data retention. Budget 10-50MB per month.

**Q: Can I integrate this with Home Assistant automations?**
A: While this add-on doesn't expose entities to Home Assistant by default, you can use the HTTP integration to query the API.

## Support

For issues or questions:
1. Check the **Logs** tab in the add-on
2. Review this documentation
3. Check [GitHub Issues](https://github.com/iNoels/hassio-speedtest-tracker/issues)
4. Ask the Home Assistant community

---

**Last Updated**: June 4, 2024
