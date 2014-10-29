# Mole

Easily send events to Orwell from within your Ruby application.

[![Build Status](https://travis-ci.org/doomspork/mole.svg?branch=master)](https://travis-ci.org/doomspork/mole) [![Code Climate](https://codeclimate.com/github/doomspork/mole/badges/gpa.svg)](https://codeclimate.com/github/doomspork/mole) [![Coverage Status](https://coveralls.io/repos/doomspork/mole/badge.png)](https://coveralls.io/r/doomspork/mole) [![Dependency Status](https://gemnasium.com/doomspork/mole.svg)](https://gemnasium.com/doomspork/mole)

### Installation

+ `gem install mole`

### Configuration

```ruby
Mole.config do |c|
	c.api_token = 'Your Orwell API Token'
end
```

### Usage

```ruby
@channel = Mole.channel(:accounts)
@channel.record(:new_account, params[:email], params)

@channel = Mole.track(@user.email, :accounts)
@channel.record(:password_change)
```
