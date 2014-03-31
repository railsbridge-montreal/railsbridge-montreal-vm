# RailsBridge Montreal Virtual Machine

To workshop participants: this is the "behind the scenes" stuff that instructors use to create the virtual machine that you will use. You should install the virtual machine image file, not this code. Please follow [the instructions on the RailsBridge Montreal site](http://docs.railsbridge-montreal.com/before-the-workshop/) to set up your virtual machine.

To instructors and TAs: if you're interested in helping to maintain the VM, keep reading.

## Setup of the generated VM

The base box is Ubuntu 12.04 LTS. The VirtualBox guest additions are updated from the `debfx/virtualbox` PPA (currently version 4.2); we should ask students to install the same version of the VirtualBox host.

The target Ruby version is 2.1.1, and Rails version is 4.0. We may need to explicitly specify these in the future.

We use `rbenv` to build/install Ruby, and invoke it in the user's `.bash_profile` to set their `PATH`. It provides a version of `gem` that defaults to user installs.

## Building a fresh image

The Vagrantfile will allow you to rebuild the RailsBridge Montreal VM from scratch. Run:

```bash
$ rake up
```

This just runs `vagrant up`. The base box will be downloaded directly from Ubuntu if it hasn't already been added. Building Ruby takes a while, so get some coffee.

Then, to create an image file to distribute:

```bash
rake package
```

This will create an image file name `railsbridgevm-version.box`, where the `version` is based on the tag you have checked out.

When you are ready to make the "gold master" version that we will ask students to download, create (and push to GitHub) a tag with the year and month of the workshop (e.g. `2014-01`) before running `rake package`. During the process of testing an image, you can run `rake package` with an untagged commit; the version will then include its SHA and how many commits it is ahead of the last tag.

## What to edit in this repo

To keep things simple and easy for everyone to modify, we use a shell script provisioner. There are two scripts:

* `provision-root.sh` runs as root (installs packages and customizations)
* `provision-user.sh` runs as the `vagrant` user (installs rbenv ruby and gems to home directory)

Files are copied into the VM from these directories:

* `binfiles` to `/usr/local/bin` (as root)
* `etcfiles` to `/etc` (as root)
* `dotfiles` to `/home/vagrant` (as the user)

## Credits

Thanks to the [Railsbridge Boston](https://github.com/railsbridge-boston/railsbridge-boston-vm) team for the original version.
