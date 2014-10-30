# Mole

Easily send events to Orwell from your Ruby applications.

[![Gem Version](https://badge.fury.io/rb/orwell-mole.png)](https://rubygems.org/gems/orwell-mole) [![Build Status](https://travis-ci.org/doomspork/mole.svg?branch=master)](https://travis-ci.org/doomspork/mole) [![Code Climate](https://codeclimate.com/github/doomspork/mole/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mole) [![Coverage Status](https://coveralls.io/repos/doomspork/mole/badge.png)](https://coveralls.io/r/doomspork/mole) [![Dependency Status](https://gemnasium.com/doomspork/mole.svg)](https://gemnasium.com/doomspork/mole)

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
	- `:sidekiq` - _In progress_

## Usage

To create a channel for a specific user's actions, add the following line to the beginnging of your code:

```ruby
@channel = Mole.track(@user.email, :accounts)
```

Now to record an event on this channel we use:

```ruby
@channel.record(:new_tweet, tweet: '...', timestamp: '...')
```

Alternatively it may be necessary for a channel to remain open where individual events will be tagged with differing identifiers, to create one of these channels we use:

```ruby
@channel = Mole.channel(:accounts)
```

When we record events on one of these channels it's required that an identifier is provided as second parameter followed by any additional details:

```ruby
@channel.record(:new_account, params[:email], params)
```


## Contributing

Feedback and fixes are always welcome.  Please make use of [Issues](https://github.com/doomspork/autocomplete-me/issues) and [Pull Requests](https://github.com/doomspork/autocomplete-me/pulls), all code should have test coverage.

## Author/Contact

Mole is written and maintained by [@doomspork](github.com/doomspork).

## License

Mole is made available under the [MIT](http://opensource.org/licenses/MIT) License.
