# No gems docs
sudo -u ubuntu sh -c 'echo "gem: --no-ri --no-rdoc" > /home/ubuntu/.gemrc'

# FIXME: both gem install fails with:
# ERROR:  While executing gem ... (Errno::EACCES)
#     Permission denied - /var/lib/gems
# I have to `vagrant ssh` in the machine and run `gem install` manually
#
sudo su ubuntu
PATH=/home/ubuntu/.rbenv/shims:$PATH
gem install bundler
gem install rails
