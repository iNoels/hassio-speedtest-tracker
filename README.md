# Speedtest Tracker Add-on for Home Assistant

A Home Assistant add-on for running [Speedtest Tracker](https://github.com/alexjustesen/speedtest-tracker) - a self-hosted application that monitors the performance and uptime of your internet connection.

## Installation

1. Go to **Settings → Add-ons → Add-on Store** in Home Assistant
2. Click the menu (⋮) → **Repositories**
3. Add this repository: `https://github.com/iNoels/hassio-speedtest-tracker`
4. Close the dialog
5. You should now see "Speedtest Tracker" in the add-on list
6. Click on it and press **Install**
7. Once installed, go to the **Info** tab and click **Start**
8. Wait a few seconds and click **Open Web UI**

## Configuration

The add-on comes with default settings that should work for most users:

- **App Port**: `8000` (default) - The port where Speedtest Tracker runs
- **App Key Length**: `32` (default) - Length of the encryption key
- **Log Level**: `info` - Verbosity of logs (debug, info, notice, warning)

You can modify these in the add-on **Configuration** tab if needed.

## Usage

Once the add-on is running, you can access Speedtest Tracker at:
```
http://homeassistant.local:8000
```

### Setting Up Speedtest Tests

1. Open the Speedtest Tracker web interface
2. Configure your speedtest provider (Ookla Speedtest or other options)
3. Set up scheduling for automatic tests
4. Monitor your internet performance over time

## Data Persistence

All Speedtest Tracker data is stored in `/config/speedtest-tracker/` and will persist across add-on restarts and Home Assistant updates.

## Networking

The add-on exposes port **8000** on your Home Assistant network. You can access it at:
- **Local**: `http://homeassistant.local:8000`
- **IP Address**: `http://<your-ha-ip>:8000`

## Troubleshooting

### Add-on won't start

1. Check the **Logs** tab for error messages
2. Ensure port 8000 is not in use by another add-on
3. Try restarting the add-on

### Can't access the web interface

1. Verify the add-on is running (green **Start** button)
2. Check your network connectivity
3. Verify the port mapping in the add-on settings

### Data not being saved

1. Ensure `/config` has enough free space
2. Check the **Logs** tab for errors
3. Verify write permissions in the data directory

## Support

- 📖 See [Speedtest Tracker Documentation](https://docs.speedtest-tracker.dev/)
- 🐛 Report issues: [GitHub Issues](https://github.com/iNoels/hassio-speedtest-tracker/issues)
- 💬 Home Assistant Community: [Home Assistant Community Forum](https://community.home-assistant.io/)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This add-on is licensed under the MIT License.

## Credits

- [Speedtest Tracker](https://github.com/alexjustesen/speedtest-tracker) by Alex Justesen
- [LinuxServer.io](https://www.linuxserver.io/) for the base Docker image
- [Home Assistant](https://www.home-assistant.io/) for the amazing platform
