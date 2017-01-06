
# Faster, better OSX for Team Software Development

This project is inspired and seeded by the code at https://github.com/mathiasbynens/dotfiles. It has been stripped
down and re-arranged to focus on team software development instead of hacking. Accordingly themes have been relegated
to being an 'extras' addition (see more below). And, the project has been re-arranged into  smaller file chunks
to allow individual team members to quickly identify the changes they want to make, or delete whole files to
forgo those settings.

## Installation

**Warning:** If you want to give these OSX settings a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use these settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. The bootstrap script will pull in the latest version and execute them.

```bash
git clone https://github.com/PelotonTechIO/OSXBootstrap.git && source OSXBootstrap/bootstrap.sh
```

To update, `cd` into your local `OSXbootstrap` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
source bootstrap.sh --f
```

To install packages and avoid updating system preferences:

```bash
source bootstrap.sh --noprefs
```

Or conversely, if you've already got packages installed and don't want them
messed with, but do want some sane system preferences for software development

```bash
source bootstrap.sh --nopkgs
```

And, to append additional shell scripts from your team or personal private
repository, add the --extras argument followed by a comma delimited list of github repos.

```bash
source bootstrap.sh --extras "jb-brown/JBDotfiles,PelotonTechIO/CodeBootstrap,jb-brown/JBBootstrap"
```

### Git-free install

To install these files without Git:

```bash
cd; curl -#L https://github.com/PelotonTechIO/OSXBootstrap/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE-MIT.txt}
```

To update later on, just run that command again.


## Add custom commands without creating a new fork

To extend this code base with your personal preferences without the maintenance that might come with forking, setup a github repo (or multiple) containing your shell scripts, and simply pass the name of those repos to bootstrap.sh as the value of the --extras argument.

For example dotfiles and color themes are not usually universally agreed upon by a team, and forcing one set on everyone never goes over well. Instead, you might setup your own repo for your dotfiles and pass it in to the --extras argument. This allows a "core" set of package and system setup for a software team to be communally managed as code while also allowing personal variation beyond it - also managed as code.

For example the following command would:

```bash
source bootstrap.sh --extras "jb-brown/JBDotfiles,PelotonTechIO/CodeBootstrap,jb-brown/JBBootstrap"
```


1. Run the setup from this repo via bootstrap.sh
2. Then clone <http://github.com/jb-brown/JBDotfiles> and apply my dotfiles, which I can share publicly, but not everyone on my team wants to use.
3. Followed by some cloning a private repo our team uses to support the current Peloton customers.
4. And finally use my own private repo to setup my filesystem of personal stuff like music, pictures, and books.


## Feedback

Suggestions/improvements
[welcome](https://github.com/PelotonTechIO/bootstrapOSX/issues)!


## Thanks to…
* Mathias Bynens and everyone he thanks on his great work at https://github.com/mathiasbynens/dotfiles
