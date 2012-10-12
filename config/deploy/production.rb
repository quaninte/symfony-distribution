#
# You should only need to edit the domain, deploy_to, user.
#
set :domain          , ""
set :deploy_to       , "/var/www/vhosts/#{domain}/httpdocs"
set :user            , ""
set :branch          , "master"
set :can_cold_deploy , true

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Rails migrations will run

