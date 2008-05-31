set :application, "planetrails.digitalcodes.org"
set :repository,  "git://github.com/anildigital/planet.git"

set :deploy_via, :remote_cache 
set :deploy_to, "/home/anil/public_html/#{application}"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

set :port, 2222

set :scm, :git

ssh_options[:paranoid] = false

set :user, 'anil'
set :runner, user
set :use_sudo, 'false'

role :app, application
role :web, application
role :db,  application, :primary => true

desc "Reload Nginx"
task :reload_nginx do 
  sudo "/etc/init.d/nginx reload" 
end

after "deploy", "reload_nginx"
after "deploy", "deploy:cleanup"
