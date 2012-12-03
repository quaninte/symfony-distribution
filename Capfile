load 'deploy' if respond_to?(:namespace) # cap2 differentiator

require 'capifony_symfony2'
load '#{symfony_app_path}/config/deploy'

# Load in the multistage configuration and setup the stages
set :stages,        %w(beta production)
set :default_stage, "beta"
set :stage_dir,     "app/config"
require 'capistrano/ext/multistage'

set :shared_children,    %w(web/uploads app/logs)
set :shared_files,       %w()
