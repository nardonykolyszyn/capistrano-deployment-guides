# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.14.1'

# set up app directory and repo
set :application, 'application_name'
set :repo_url, 'git@github.com:username/project.git'
set :username, 'server_username'

# For Rails 5+ you will need to copy your master.key file in shared path
# set :linked_files, fetch(:linked_files, []).push('.env', 'config/master.key')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public')
set :rbenv_ruby, '2.6.2' # Replace your desired Ruby version here.
