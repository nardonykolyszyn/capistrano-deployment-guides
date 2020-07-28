# frozen_string_literal: true

server 'IP_SERVER', user: fetch(:username), roles: %w[web app db]
set :deploy_to, "/home/#{fetch(:username)}/#{fetch(:application)}"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :rails_env, 'production' # Set your project env here
