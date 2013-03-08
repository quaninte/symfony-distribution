####
#
# Production Deployment Configuration
#
# :domain - Enter IP address to server or domain name
# :deploy_to - Location on remote server that you want to put
#              your code, will create 3 directories inside
#              this directory
# :user - SSH username that logs into server for deployment
# :branch - What branch in git needs to be deployed
set :domain,          "" # :EDIT:
set :deploy_to,       "/var/www/#{domain}" # :EDIT:
set :user,            "" # :EDIT:
set :branch,          "master" # :EDIT:
set :can_cold_deploy, true

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Rails migrations will run

