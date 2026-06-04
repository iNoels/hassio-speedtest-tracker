## Quick Reference (Kurzfassung aus QUICKSTART.md)

### Personalization
 - **GitHub username**: `iNoels`
 - **Email**: `nils.lueneburg@gmail.com`
 - **Name**: `Nils Lüneburg`

### Key Files Explained
 | File | Purpose | Edit? |
 |------|---------|-------|
 | `addon.yaml` | Add-on config (version, ports, etc.) | ✏️ Yes |
 | `config.json` | Configuration UI schema | ✏️ Yes |
 | `Dockerfile` | Docker image builder | ⚠️ Maybe |
 | `repository.json` | Home Assistant repository metadata | ✏️ Yes |
 | `DOCS.md` | User documentation | ✏️ Yes |
 | `build.yml` | Auto-build Docker images | ❌ No (unless customizing) |
 | `update-check.yml` | Auto-update checker | ❌ No (optional) |

### Installation for Users
 Users add your repository like this:

 ```
 https://github.com/iNoels/hassio-speedtest-tracker
 ```

 In Home Assistant:
 1. Settings → Add-ons & Automations → Add-ons → Add-on Store
 2. ⋮ (menu) → Repositories → Add `https://github.com/iNoels/hassio-speedtest-tracker`
 3. Install "Speedtest Tracker" add-on
 4. Start and access at `http://homeassistant.local:8000`

### Common Tasks (Schnelle Befehle)

 Update Version
 ```bash
 # In speedtest-tracker/addon.yaml
 version: 1.0.1

 # Then commit and tag
 git tag -a v1.0.1 -m "Release v1.0.1"
 git push origin main --tags
 ```

 Fix a Bug
 ```bash
 git checkout -b bugfix/issue-name
 # Make changes
 git commit -am "Fix: description"
 git push origin bugfix/issue-name
 ```

 Update Documentation
 ```bash
 git commit -am "docs: update installation guide"
 git push origin main
 ```

### Important Links

 - **Your Repository**: `https://github.com/iNoels/hassio-speedtest-tracker`
 - **Home Assistant Add-ons Docs**: https://developers.home-assistant.io/docs/add-ons
 - **Speedtest Tracker Project**: https://github.com/alexjustesen/speedtest-tracker
 - **LinuxServer.io Image**: https://hub.docker.com/r/linuxserver/speedtest-tracker
 - **GitHub Container Registry**: https://ghcr.io

### Troubleshooting Checklist

 | Issue | Check |
 |-------|-------|
 | Docker build fails | Check Dockerfile syntax, base image availability |
 | Can't access web UI | Verify port 8000 is exposed, add-on is running |
 | Add-on won't start | Check logs, verify Health check passes, check Docker image |
 | GitHub Actions doesn't run | Enable Actions, check workflows are enabled |
 | Icons don't appear | File format PNG, size 256x256, placed in `speedtest-tracker/` |

### Need Help?

 1. **GitHub Issues**: https://github.com/iNoels/hassio-speedtest-tracker/issues
 2. **Home Assistant Community**: https://community.home-assistant.io
 3. **Speedtest Tracker Issues**: https://github.com/alexjustesen/speedtest-tracker/issues

### Next Steps

 1. ✅ Personalize all configuration files
 2. ✅ (Optional) Create and add icons
 3. ✅ Create GitHub repository and push code
 4. ✅ Verify GitHub Actions workflows are running
 5. ✅ Create a release with git tags
 6. ✅ Test in Home Assistant
 7. ✅ Share with community!

 ---

 Happy coding! 🚀
# Setup Guide

## Quick Start for Developers

### Prerequisites

- Git
- GitHub account
- Docker (for local testing)
- Home Assistant OS or Supervised installation (for testing the add-on)

### Step 1: Clone the Repository

```bash
git clone https://github.com/iNoels/hassio-speedtest-tracker.git
cd hassio-speedtest-tracker
```

### Step 2: Update Configuration Files

Replace `yourusername` with your actual GitHub username in:
- `speedtest-tracker/addon.yaml` (already set to iNoels)
- `speedtest-tracker/config.json` (already set to iNoels)
- `repository.json` (already set to iNoels)
- `README.md` (already set to iNoels)
- `.github/workflows/build.yml` (already set to iNoels)

### Step 3: Customize Your Add-on

Edit `speedtest-tracker/addon.yaml` to set:
- Name, description, and version
- Supported architectures
- Port configuration
- Environment variables
- Health check settings

### Step 4: Build Docker Image Locally (Optional)

```bash
cd speedtest-tracker
docker build -t speedtest-tracker:latest .
```

### Step 5: Test in Home Assistant

1. Copy the entire `speedtest-tracker/` folder to:
   ```
   /root/config/addons/local/speedtest-tracker/
   ```
   (Or use the Add-on Store if you've set up GitHub Actions)

2. Reload add-ons: Settings → Add-ons & Automations → Add-ons → **⚙️ Create Automation** → **Settings** → **Reload Add-on** (or restart Home Assistant)

3. The local add-on should now appear in the Add-on Store

4. Install and start it

## Setting Up GitHub Actions

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Name: `hassio-speedtest-tracker`
3. Description: "Home Assistant Add-on for Speedtest Tracker"
4. Make it **Public** (required for free GitHub Actions)
5. Click **Create repository**

### Step 2: Push Your Code

```bash
git remote add origin https://github.com/iNoels/hassio-speedtest-tracker.git
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Actions

1. Go to your repository
2. Click **Actions** tab
3. Workflows should be automatically detected
4. Click **"Build Add-on Docker Images"** → **Enable workflow**

### Step 4: Configure Container Registry

To push Docker images to `ghcr.io`:

1. GitHub automatically creates `GITHUB_TOKEN` for push access
2. The workflow uses this by default
3. No additional secrets needed!

Images will be pushed to:
- `ghcr.io/iNoels/speedtest-tracker-amd64`
- `ghcr.io/iNoels/speedtest-tracker-aarch64`
- `ghcr.io/iNoels/speedtest-tracker-armv7`

## Creating a Release

### Step 1: Update Version

Edit `speedtest-tracker/addon.yaml`:
```yaml
version: 1.0.1
```

### Step 2: Update Changelog

Edit `speedtest-tracker/CHANGELOG.md` with changes.

### Step 3: Commit and Tag

```bash
git add .
git commit -m "Release v1.0.1"
git tag -a v1.0.1 -m "Release version 1.0.1"
git push origin main
git push origin v1.0.1
```

This will trigger the GitHub Actions workflow to build and push Docker images automatically.

## Repository Structure

```
hassio-speedtest-tracker/
├── speedtest-tracker/                    # Add-on files
│   ├── addon.yaml                        # Add-on metadata
│   ├── config.json                       # Configuration schema
│   ├── Dockerfile                        # Docker image definition
│   ├── CHANGELOG.md                      # Version history
│   ├── DOCS.md                          # Detailed documentation
│   └── rootfs/                          # Files to include in container
│       ├── etc/services.d/speedtest-tracker/
│       │   └── run                      # s6-overlay service runner
│       └── usr/local/bin/
│           └── start_speedtest_tracker.sh  # Startup script
├── .github/
│   └── workflows/
│       └── build.yml                    # GitHub Actions CI/CD
├── repository.json                       # Repository metadata
├── README.md                            # Main documentation
├── LICENSE                              # MIT License
├── CONTRIBUTING.md                      # Contribution guidelines
└── .gitignore
```

## Testing the Add-on Locally

### Method 1: Via SSH

```bash
# SSH to Home Assistant
ssh root@homeassistant.local

# Navigate to add-ons directory
cd /mnt/data/supervisor/addons

# Clone your repository
git clone https://github.com/iNoels/hassio-speedtest-tracker.git speedtest-tracker

# Restart supervisor
supervisorctl restart addon_supervisor

# Check add-ons are loaded
# Go to Settings → Add-ons & Automations → Add-ons → reload
```

### Method 2: Via UI

1. Enable Developer Mode in Home Assistant
2. Use SAMBA or SSH to add files to `/config/addons/local/`
3. Reload add-ons in the UI

## Troubleshooting

### Docker build fails

```bash
# Check Docker logs
docker logs speedtest-tracker

# Rebuild with verbose output
docker build --no-cache -t speedtest-tracker:latest .
```

### Add-on won't start

1. Check the add-on **Logs** tab in Home Assistant
2. Look for Python errors or missing dependencies
3. Ensure `addon.yaml` is properly formatted

### GitHub Actions not running

1. Check Actions are enabled in repository settings
2. Verify workflow file syntax
3. Check repository has public access for free Actions

## Next Steps

1. ✅ Set up GitHub repository
2. ✅ Configure GitHub Actions
3. ✅ Test locally in Home Assistant
4. ✅ Create your first release
5. Share with the Home Assistant community!

## Additional Resources

- [Home Assistant Add-on Development](https://developers.home-assistant.io/docs/add-ons)
- [Docker Reference](https://docs.docker.com/reference/)
- [s6-overlay Documentation](https://skarnet.org/software/s6-overlay/)
- [Speedtest Tracker Official Docs](https://docs.speedtest-tracker.dev/)

---

Happy coding! 🚀
