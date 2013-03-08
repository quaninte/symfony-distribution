####
# Deployment configuration
#
# @see https://github.com/everzet/capifony/blob/master/lib/capifony_symfony2.rb
#
set :application, "io-symfony-standard" # :EDIT: repository name

#
# Nothing below needs to be edited, see other deployment files
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

# This makes sure that :keep_releases is enforced
after "deploy", "deploy:cleanup"

=begin
This will copy a robots.STAGE.txt file and any other file you need to the shared
directory. This makes it so you do not need to ssh into the machine to see what
is included in this file.
=end
before("deploy:finalize_update") do
  run "if [ -f #{current_release}/web/robots.#{stage}.txt ]; then cp #{current_release}/web/robots.#{stage}.txt #{current_release}/web/robots.txt; fi"
  run "if [ -f #{current_release}/app/config/parameters.#{stage}.yml ]; then cp #{current_release}/app/config/parameters.#{stage}.yml #{current_release}/app/config/parameters.yml; fi"
end

logger.level = Logger::MAX_LEVEL
