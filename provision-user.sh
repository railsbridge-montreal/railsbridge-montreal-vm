# RailsBridge Montreal VM provision script (user part)

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/ubuntu

# Our bash setup will cd to workspace on login.
cd /home/ubuntu
ln -s /vagrant workspace

# Install rbenv and Ruby
rm -rf /home/ubuntu/.rbenv
git clone https://github.com/rbenv/rbenv.git /home/ubuntu/.rbenv
git clone https://github.com/sstephenson/ruby-build.git /home/ubuntu/.rbenv/plugins/ruby-build

source /home/ubuntu/.bashrc
/home/ubuntu/.rbenv/bin/rbenv install 2.2.5
/home/ubuntu/.rbenv/bin/rbenv rehash
/home/ubuntu/.rbenv/bin/rbenv global 2.2.5

# Heroku Toolbelt
sudo wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
