# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "test_ci"
set :repo_url, "git@github.com:bob1983/test_ci.git"

set :branch, :master

set :deploy_to, "/var/www/test_ci"

set :format, :airbrussh

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases,3
