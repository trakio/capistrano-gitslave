# capistrano-gitslave

Gitslave support for Capistrano 3

## Using

### Capfile

```ruby
require 'capistrano/gitslave-strategy'
```

### Gemfile

```ruby
gem 'capistrano-gitslave'
```

### deploy.rb

```ruby
set :scm, :git
set :git_strategy, Capistrano::Git::SlaveStrategy
```

### .gitslave

You .gitslave file must reference the absolute link to the repostory, contrary to the advice on the .gitslave instructions.

I couldn't work out a way to keep relative urls without having to redefine your slave repositorys in the Capistrano configuration. See the TODO section below for some ideas on this.

## TODO

### Relative Repository Paths

The process might look something like this

1. Override Capistrano::Git#repo\_path to be `File.join(context.repo\_path, 'master')
2. Archive master's .gitslave file into a tmp location
3. Read it for details on required repos
4. Run clone and update on these slave repos into `File.join(context.repo\_path, slave_repo)

### Not actually using Gitslave

Gitslave is probably a bit heavy for what we need when deploying, and we could save ourselves the hassel of installing it.
Once we have all the slave repositories mirrored on the machine, we simply need to archive each of them into the release path based on the master's .gitslave file.

## Contributing to capistrano-gitslave

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

== Copyright

Copyright (c) 2014 Trak.io Ltd
