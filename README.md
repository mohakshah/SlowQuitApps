# Slow Quit Apps

An OS X app that adds a global delay of 1 second to the Cmd-Q shortcut. In
other words, you have to hold down Cmd-Q for 1 second before an application
will quit.

When the delay is active, an overlay is drawn at the center of the screen.

## Why?

A quick search for 'command q' on Google revealed these insights:

* "have you ever accidentally hit ⌘Q and quit an app"
* "how to disable command-Q"
* "Command-Q is the worst keyboard shortcut ever"
* "ever hit Command-Q instead of Command-W and lost all of your open web pages in Safari?"

... and many more similar sentiments.

Some proposed solutions include:

* remapping Cmd-Q to do something else
* changing the application quit keyboard short to use another keybinding

This app implements the same approach as Google Chrome's "Warn Before Quitting"
feature, except it is now available on every app!

## Download & Install

Pre-built binaries can be downloaded from the [releases page](https://github.com/dteoh/SlowQuitApps/releases).

Unzip, drag the app to Applications, and then run it. You can optionally
choose to automatically start the application on login.

### Homebrew

If you wish to install the application from Homebrew:

```
$ brew tap dteoh/sqa
$ brew cask install slowquitapps
```

The application will live at `/Applications/SlowQuitApps.app`.

Updating the app:

```
$ brew update
$ brew cask reinstall slowquitapps
$ killall SlowQuitApps
```

Then relaunch the application.

Or using [brew-cask-upgrade](https://github.com/buo/homebrew-cask-upgrade):

```
$ brew cu slowquitapps
```

### Compatibility

The app works on Mountain Lion (10.8) and newer.

## Customization

You must exit and relaunch SlowQuitApps after making customizations.

To exit the app:

```
$ killall SlowQuitApps
```

### Changing default delay

The currently set delay can be reviewed with:

    $ defaults read com.dteoh.SlowQuitApps

To change the delay to 5 seconds for example, open up Terminal app and
run the following command:

    $ defaults write com.dteoh.SlowQuitApps delay -int 5000

The delay is specified in milliseconds.

### Whitelisting applications

Whitelisted apps will be sent the Cmd-Q keypress directly.

To whitelist an app, start by locating its bundle ID. For example, to whitelist
the "Notes" application:

    $ osascript -e 'id of app "Notes"'
    com.apple.Notes
    $ defaults write com.dteoh.SlowQuitApps whitelist -array-add com.apple.Notes

To reset the whitelist:

    $ defaults delete com.dteoh.SlowQuitApps whitelist

To check whitelisted apps:

    $ defaults read com.dteoh.SlowQuitApps whitelist

### Disable by defaults
You can change the operation mode of the app so that it sends Cmd-Q directly to all apps by default and only adds delay to the apps listed in the whitelist. To do this, you must set the `disabledByDefault` property to `true` like so:
```bash
defaults write com.dteoh.SlowQuitApps disabledByDefault -bool true
```

Setting this property to `false` will reset the behaviour back to normal.
