# Mina-Tail

Tasks for tailing Rails log files in a Mina deployment environment

## Installation

Add this line to your application's Gemfile:

```rb
gem 'mina-tail', require: false
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:


Require `mina/tail` in your `config/deploy.rb`:

```rb
require 'mina/tail'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

...

task setup: :environment do
  ...
end

## Usage

```shell
$ mina production tail:live
```

Tails `log/production.log` live.

```shell
$ mina production tail:live file=unicorn.err.log
```

Tails `log/unicorn.err.log` live.

```shell
$ mina production tail:last
```

Returns the last 2000 lines of the `log/production.log`

```shell
$ mina production tail:last lines=20
```

Returns the last 20 lines of the `log/production.log`

```shell
$ mina production tail:last file=unicorn.err.log lines=20
```

Returns the last 20 lines of the `log/production.log`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
