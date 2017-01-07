
# Faster, better OSX for Team Software Development

OSX ships with defaults appropriate for general consumers - not software developers.  

Siri isn't a good pair programming partner, Notification Center is a source of distraction, the bootup and phone ringing sounds are jarring when working in a shared space, guest accounts are a security issue, spotlight indexes and searches fonts, movies, and spreadsheets. 


**This project changes all those things and more** - so that your mac has sane defaults for software development teams. Quickly, easily, repeatably - without overdoing forced standardization. The project is arranged into small file chunks
to allow individual team members to quickly identify the changes they want to make, or delete whole files to forgo those settings. Additionally, it's designed for personalization through extension by chaining on a list of other github repos to clone and execute in [your personal gist script] (https://gist.github.com/jb-brown/26735fe889809312bfaa42e4c1d613ba) for bootstrapping your setup.


## Installation

**Warning:** If you want to give these OSX settings a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use these settings unless you know what that entails. 

**Use at your own risk!**

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

## Add custom commands without creating a new fork

To extend this code base with your personal preferences without the merge maintenance that might come with forking, setup a github repo (or multiple) containing your shell scripts. Then simply pass the name of those repos to bootstrap.sh as the value of the --extras argument.

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

This project is inspired and seeded by Mathias's  code. It has been stripped down and re-arranged to focus on team software development instead of hacking and related contests. Accordingly themes have been relegated to being an 'extras' addition (see more below). And, the project has been re-arranged into smaller file chunks to allow individual team members to quickly identify the changes they want to make, or delete whole files to forgo those settings.

