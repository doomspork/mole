# Mole

Easily send events to Orwell from your Ruby applications.

[![Gem Version](https://badge.fury.io/rb/orwell-mole.png)](https://rubygems.org/gems/orwell-mole) [![Build Status](https://travis-ci.org/doomspork/mole.svg?branch=master)](https://travis-ci.org/doomspork/mole) [![Code Climate](https://codeclimate.com/github/doomspork/mole/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mole) [![Coverage Status](https://coveralls.io/repos/doomspork/mole/badge.png?branch=master)](https://coveralls.io/r/doomspork/mole?branch=master) [![Dependency Status](https://gemnasium.com/doomspork/mole.svg)](https://gemnasium.com/doomspork/mole)

## Installation

Add this line to your application's Gemfile:

	gem 'orwell-mole', require: 'orwell/mole'

And then execute:

	$ bundle install

Or install it yourself as:

	$ gem install orwell-mole

And require it:

	require 'orwell/mole'

## Configuration

Currently there is only one required configuration option: `api_token`.

```ruby
Mole.config do |c|
  c.api_token = 'your orwell api token'
  c.logger    = Log4r::Logger[Rails.env]
end
```

### Options
+ `api_token` - The application's API token provided by Orwell.
+ `logger` - Override the logger Mole will use, the default uses `Logger` to stdout.
+ `method` - Set the transport used by Mole to transmit events, valid options:
	- `:basic_http` - No frills HTTP requests via `net/http`, the default.
  - `:sucker_punch` - Uses [SuckerPunch](https://github.com/brandonhilkert/sucker_punch) to asynchroniously transmit events.
	- `:sidekiq` - Similar to `:sucker_punch` but the underlying library is [Sidekiq](https://github.com/mperham/sidekiq).

_Note_: To use either `:sucker_punch` or `:sidekiq` you'll need to require them first:

```ruby
# Sidekiq
require 'orwell/mole/transport/sidekiq'

# SuckerPunch
require 'orwell/mole/transport/sucker_punch'
```

## Usage

To record an event all we need to do is:

```ruby
Mole.record(:new_tweet, tweet: '...', timestamp: '...')
```

## Contributing

Feedback and fixes are always welcome.  Please make use of [Issues](https://github.com/doomspork/autocomplete-me/issues) and [Pull Requests](https://github.com/doomspork/autocomplete-me/pulls), all code should have test coverage.

## Author/Contact

Mole is written and maintained by [@doomspork](github.com/doomspork).

## License

Mole is made available under the [MIT](http://opensource.org/licenses/MIT) License.
