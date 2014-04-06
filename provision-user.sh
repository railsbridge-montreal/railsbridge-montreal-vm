# RailsBridge Montreal VM provision script (user part)

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/vagrant

# Our bash setup will cd to workspace on login.
cd /home/vagrant
ln -s /vagrant workspace

# Install rbenv and Ruby
rm -rf /home/vagrant/.rbenv
git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

source /home/vagrant/.bashrc
/home/vagrant/.rbenv/bin/rbenv install 2.1.1
/home/vagrant/.rbenv/bin/rbenv rehash
/home/vagrant/.rbenv/bin/rbenv global 2.1.1

# Heroku Toolbelt
sudo wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
