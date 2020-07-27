# {0.1} Nginx + Puma
--------------------

This guide describes how to integrate a Ruby on Rails with Puma and Nginx as web server.

## Requirements

⁃ NodeJS or any other JS runtime environment alternative (Optional)

⁃ Nginx previous installation

  ‣ [In case you use Docker](https://hub.docker.com/_/nginx)
  ‣ In case you use global installation:

  ```bash
    $ sudo apt install nginx
  ```

⁃ Rails ~> "4"

⁃ Firewall or Security group previously configured

⁃ Rbenv

  ‣ [Why and How I Replaced RVM with RBENV](https://dev.to/krtb/why-and-how-i-replaced-rvm-with-rbenv-23ad)


## Installation
---------------

> NOTE: This process is completely agnostic, so, I will avoid cloud based services configurations processes such as AWS, GCP or Azure. This is made to work on basically any server.

I will suppose you have your application ready and working locally, so, first step is installing project dependencies and add initial configuration files, let's get started:

Add these dependencies in your current Gemset (Gemfile) under development group:

```ruby
  group :development do
    gem 'capistrano'
    gem 'capistrano-bundler'
    gem 'capistrano-rails'
    gem 'capistrano-rbenv'
    gem 'capistrano-sidekiq' # Optional, just in case you use Sidekiq framework.
    gem 'capistrano3-puma'
  end
```

And then:


```
  $ bin/bundle install
```

> NOTE: To avoid dependencies issues, I didn't specified gems versions, you can read these gems documentation to see what's the propest version you need or you can just run this command:

```bash
  $ bin/bundle add capistrano capistrano-bundler capistrano-rails capistrano-rbenv capistrano-sidekiq capistrano3-puma --group=development
```

And it'll install all dependencies by yourself specifing what versions you need automatically.

> TIP: Don't forget to sort out your Gemfile because of Rubocop style guide. [Ordinare: Gemfile Sorter](https://github.com/nikolalsvk/ordinare)

Then, you can generate Capistrano configuration files by running:

```bash
  $ bin/bundle exec cap install
```

This will create essential Capistrano files and directories for two environments by default (Production and Staging).

```
├── Capfile
├── config
  │   ├── deploy
│   │   ├── production.rb
│   │   └── staging.rb
│   └── deploy.rb
└── lib
    └── capistrano
            └── tasks
```

To see more information about Capistrano set-up process: (https://github.com/capistrano/capistrano)

-----------------------------------

Now you need to configure your Capfile that's essentially where you global configuration live in, you can copy and paste from here:

‣ [Capfile template](./config/Capfile)

## Deployment
-------------
