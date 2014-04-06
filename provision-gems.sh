# FIXME: both gem install fails with:
# ERROR:  While executing gem ... (Errno::EACCES)
#     Permission denied - /var/lib/gems
# I have to `vagrant ssh` in the machine and run `gem install` manually
#
gem install bundler
gem install rails
