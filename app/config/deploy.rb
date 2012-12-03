# Change the application to the git repository name minus
# the .git
#
# As an example, io-symfony-standard.git would be io-symfony-standard
set :application,             "io-symfony-standard"

#
# Nothing below needs to be edited
# @see config/deploy/beta.rb
# @see config/deploy/production.rb
#

set :scm,                     :git
set :git_enable_submodules,   1
set :deploy_via,              :remote_cache
set :repository,              "git@git.iostudiohq.com:#{application}.git"
set :use_sudo,                false
set :group_writable,          false
set :keep_releases,           3
ssh_options[:forward_agent] = true

#
# Capifony settings
#
set :use_composer,        true
#set :composer_options,    "--no-scripts --verbose --prefer-dist"
set :update_vendors,      false
set :dump_assetic_assets, true
set :copy_vendors,        true


after "deploy", "deploy:cleanup"

=begin
This will copy a robots.txt.STAGE file and any other file you need to the shared
directory. This makes it so you do not need to ssh into the machince to see what
is included in this file.
=end
before("deploy:finalize_update") do
  run "if [ -f #{current_release}/web/robots.txt.#{stage} ]; then cp #{current_release}/web/robots.txt.#{stage} #{current_release}/web/robots.txt; fi"
  run "if [ -f #{current_release}/app/config/parameters.yml.#{stage} ]; then cp #{current_release}/app/config/parameters.yml.#{stage} #{current_release}/app/config/parameters.yml; fi"
end

logger.level = Logger::MAX_LEVEL
