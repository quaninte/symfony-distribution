# Change the application to the git repository name minus
# the .git
#
# As an example, io-symfony-standard.git would be io-symfony-standard
set :application,             "io-symfony-standard"

#
# Nothing below needs to be edited
#

set :scm,                     :git
set :git_enable_submodules,   1
set :deploy_via,              :remote_cache
set :repository,              "git@git.iostudiohq.com:#{application}.git"
set :use_sudo,                false
set :group_writable,          false
set :keep_releases,           3
ssh_options[:forward_agent] = true
set :use_composer,            true
set :update_vendors,          true
set :dump_assetic_assets,     true

namespace :deploy do
  desc "Customize the finalize_update task to work with wordpress." 
  task :finalize_update, :except => { :no_release => true } do
    # Share common files & folders
    share_childs
  end

  desc "Symlink static directories and static files that need to remain between deployments." 
  task :share_childs do
    if shared_children
      shared_children.each do |link|
        run "mkdir -p #{shared_path}/#{link}" 
        run "if [ -d #{release_path}/#{link} ] ; then rm -rf #{release_path}/#{link}; fi" 
        run "ln -nfs #{shared_path}/#{link} #{release_path}/#{link}" 
      end
    end
    if shared_files
      shared_files.each do |link|
        link_dir = File.dirname("#{shared_path}/#{link}")
        run "mkdir -p #{link_dir}" 
        run "touch #{shared_path}/#{link}" 
        run "ln -nfs #{shared_path}/#{link} #{release_path}/#{link}" 
      end
    end
  end
end

after("deploy:symlink") do
     deploy.cleanup
end

=begin
This will copy a robots.txt.STAGE file and any other file you need to the shared
directory. This makes it so you do not need to ssh into the machince to see what
is included in this file.
=end
before("deploy:finalize_update") do
  run "if [ -f #{current_release}/web/robots.txt.#{stage} ]; then cp #{current_release}/web/robots.txt.#{stage} #{current_release}/web/robots.txt; fi"
  run "if [ -f #{current_release}/app/config/parameters.yml.#{stage} ]; then cp #{current_release}/app/config/parameters.yml.#{stage} #{current_release}/app/config/parameters.yml; fi"
end
