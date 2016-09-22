# RailsBridge Montreal VM provision script

# Before doing anything else, copy our files into place.
rsync -rtv /vagrant/etcfiles/ /etc
rsync -rtv /vagrant/binfiles/ /usr/local/bin

# Add virtualbox deb repo and keys so we can upgrade guest additions.
# This will also get any security updates not in the base image.

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib > /etc/apt/sources.list.d/virtualbox.list
apt-get update
apt-get -y upgrade

# Railsbridge MOTD
apt-get -y -q install update-motd
rm /etc/update-motd.d/*

sh -c "cat > /etc/update-motd.d/10-railsbridge << 'EOT'
#!/bin/sh

echo ''
echo '   ========================================'
echo '    ____      _     ___  _      ____'
echo '   |  _ \    / \   |_ _|| |    / ___|'
echo '   | |_) |  / _ \   | | | |    \___ \'
echo '   |  _ <  / ___ \  | | | |___  ___) |'
echo '   |_|_\_\/_/__ \_\|___||_____||____/_____'
echo '   | __ ) |  _ \ |_ _||  _ \  / ___|| ____|'
echo '   |  _ \ | |_) | | | | | | || |  _ |  _|'
echo '   | |_) ||  _ <  | | | |_| || |_| || |___'
echo '   |____/ |_| \_\|___||____/  \____||_____|'
echo ''
echo '   ========================================'
echo ''
echo '   Welcome to the Railsbridge Montreal virtual machine!  The RailsBridge VM is a *computer within your computer*'
echo '   running the Linux operating system.  Everything you need is installed, including:'
echo '   Ruby 2.2, Rails 4.2, sqlite3, the heroku toolbelt, and git.'
echo ''
echo '   When you start your Rails app, visit http://localhost:3000 in your web browser.'
echo ''
echo '   The ~/workspace directory is shared with the folder on your laptop where you created this VM.  Any file you'
echo '   put there in your laptop will appear here in ~/workspace.  This lets you edit files with an OSX or Windows'
echo '   text editor, and run them here in the VM.'
echo ''
echo '   To leave the virtual machine, type'
echo '       exit'
echo '   and hit return. '
echo ''
echo '   ========================================'
echo ''

EOT"

chmod +x /etc/update-motd.d/10-railsbridge
# Force message
run-parts /etc/update-motd.d/

# Other packages we need
apt-get -y -q install git vim nodejs \
                          build-essential openssl \
                          gawk libreadline6-dev zlib1g zlib1g-dev \
                          libssl-dev libyaml-dev \
                          autoconf libgdbm-dev libncurses5-dev \
                          automake libtool bison pkg-config libffi-dev \
                          libxml2-dev libxslt-dev libxml2 libmagick++-dev \
                          sqlite3 libsqlite3-dev


# Clean up APT cache and zero out disk to reduce image size
apt-get -y autoremove
apt-get clean
# Remove size optimisation as it currently seems to simply hang
# dd if=/dev/zero of=/EMPTY bs=1M
# rm -f /EMPTY
