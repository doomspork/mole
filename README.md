# Mole

Easily send events to Orwell from within your Ruby application.

[![Gem Version](https://badge.fury.io/rb/orwell-mole.png)](https://rubygems.org/gems/orwell-mole)[![Build Status](https://travis-ci.org/doomspork/mole.svg?branch=master)](https://travis-ci.org/doomspork/mole) [![Code Climate](https://codeclimate.com/github/doomspork/mole/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mole) [![Coverage Status](https://coveralls.io/repos/doomspork/mole/badge.png)](https://coveralls.io/r/doomspork/mole) [![Dependency Status](https://gemnasium.com/doomspork/mole.svg)](https://gemnasium.com/doomspork/mole)

### Gemfile

+ `gem 'orwell-mole', require: 'orwell/mole'`

### Configuration

```ruby
Mole.config do |c|
  c.api_token = 'your orwell api token'
end
```

### Usage

```ruby
@channel = Mole.channel(:accounts)
@channel.record(:new_account, params[:email], params)

@channel = Mole.track(@user.email, :accounts)
@channel.record(:password_change)
```
