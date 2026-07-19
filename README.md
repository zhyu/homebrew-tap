# Homebrew Tap

Personal Homebrew tap for zhyu packages.

## Waymark

Install the latest Waymark nightly build:

```sh
brew install zhyu/tap/waymark
```

Or tap the repository first:

```sh
brew tap zhyu/tap
brew install waymark
```

## ccstatusline-native

Install the latest verified ccstatusline-native nightly build:

```sh
brew install zhyu/tap/ccstatusline-native
```

The tap's scheduled updater verifies the published archive checksum before it
commits a formula change. It can also be run manually from GitHub Actions.

## Roused

Install the latest verified Roused nightly build:

```sh
brew install zhyu/tap/roused
```

The formula installs a starter configuration at
`$(brew --prefix)/etc/roused/roused.toml`. Edit and validate it before starting
the current-user LaunchAgent:

```sh
roused check-config "$(brew --prefix)/etc/roused/roused.toml"
brew services start roused
```

Do not run the service with `sudo`; Roused only supports current-user
LaunchAgents.

Formula upgrades preserve this configuration and ask the new Roused binary to
regenerate the plist. Because that command validates the retained
configuration, an invalid configuration must be corrected before an upgrade
can complete.

Roused itself generates the service plist during formula installation;
Homebrew copies that package-provided plist unchanged when it starts the
service. Manage it with `brew services list`, `info`, `restart`, and `stop`.
Logs are written under `$(brew --prefix)/var/log/roused`.
