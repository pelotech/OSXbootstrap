
# Bootstrap OSX to be faster and more convenient for software development

This project is inspired and seeded by the code at https://github.com/mathiasbynens/dotfiles. It has been stripped
down and re-arranged to focus on team software development instead of hacking. Accordingly themes have been relegated
to being an 'extras' addition (see more below) and the project has been re-arranged by splitting up preferences
into smaller file chunks so that individual team members can more easily identify the changes they want to make,
and/or delete whole files to forgo those settings.

## Installation

**Warning:** If you want to give these OSX settings a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use these settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. The bootstrapper script will pull in the latest version and execute them.

```bash
git clone https://github.com/jb-brown/bootstrapOSX.git && cd bootstrapOSX && source bootstrapOSX.sh
```

To update, `cd` into your local `bootstrapOSX` repository and then:

```bash
source bootstrapOSX.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrapOSX.sh
```

### Git-free install

To install these files without Git:

```bash
cd; curl -#L https://github.com/jb-brown/bootstrapOSX/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrapOSX.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Add custom commands without creating a new fork

If `~/.extras` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

For example your `~/.extras` could include setting :your git config --global user.email and user.name


You could also use `~/.extra` to override settings from the repository.

## Feedback

Suggestions/improvements
[welcome](https://github.com/jb-brown/bootstrapOSX/issues)!

## Author

| [![twitter/jbbrown](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| Thanks! |

## Thanks to…
* Mathias Bynens and everyone he thanks on his great work at https://github.com/mathiasbynens/dotfiles
