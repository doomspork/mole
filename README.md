# Mole

Moles are responsible for keeping Orwell informed of activity within your applications.

[![Gem Version](https://badge.fury.io/rb/orwell-mole.png)](https://rubygems.org/gems/orwell-mole) [![Build Status](https://travis-ci.org/doomspork/mole.svg?branch=master)](https://travis-ci.org/doomspork/mole) [![Code Climate](https://codeclimate.com/github/doomspork/mole/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mole) [![Coverage Status](https://coveralls.io/repos/doomspork/mole/badge.png?branch=master)](https://coveralls.io/r/doomspork/mole?branch=master) [![Dependency Status](https://gemnasium.com/doomspork/mole.svg)](https://gemnasium.com/doomspork/mole)

## Installation

Add this line to your application's Gemfile:

	gem 'orwell-mole', require: 'orwell/mole'

And require it:

	require 'orwell/mole'

## Configuration

Currently the only required configuration option is: `api_token`.

```ruby
Mole.config do |c|
  c.api_token = 'your orwell api token'
  c.method = :sidekiq
end
```

### Options
+ `api_token` - The API token for the given Orwell application.
+ `method` - Transport mechanism used by Mole to send events:
	- `:basic_http` - No frills HTTP requests via `net/http`, the default.
	- `:sucker_punch` - Asynchronious transmission via [SuckerPunch](https://github.com/brandonhilkert/sucker_punch).
	- `:sidekiq` - Asynchronious transmission via [Sidekiq](https://github.com/mperham/sidekiq).

In order to use either `:sucker_punch` or `:sidekiq` you'll first need to require them:

```ruby
# Sidekiq
require 'orwell/mole/transport/sidekiq'

# SuckerPunch
require 'orwell/mole/transport/sucker_punch'
```

## Usage

Once configured sending events is easy:

```ruby
Mole.record(:new_tweet, tweet: '...', timestamp: '...')
```

## Contributing

Feedback and fixes are always welcome.  Please make use of [Issues](https://github.com/doomspork/mole/issues) and [Pull Requests](https://github.com/doomspork/mole/pulls), all code should have test coverage.

## Author/Contact

Mole is written and maintained by [@doomspork](github.com/doomspork).

## License

Mole is made available under the [MIT](http://opensource.org/licenses/MIT) License.
