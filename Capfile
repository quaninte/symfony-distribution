load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/bundles/*/*/recipes/*.rb'].each { |bundle| load(bundle) }
load Gem.find_files('symfony2.rb').last.to_s
load 'app/config/deploy'
require 'rubygems' 
require 'railsless-deploy'
load 'config/deploy' # remove this line to skip loading any of the default tasks
# Load in the multistage configuration and setup the stages
set :stages, %w(beta production)
require 'capistrano/ext/multistage'
set :shared_children,    %w(web/uploads vendor app/logs)
set :shared_files,      %w(app/config/parameters.yml web/robots.txt)
