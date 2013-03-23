Whiskey
-------

  - [![Gem Version](https://badge.fury.io/rb/whiskey.png)](https://rubygems.org/gems/whiskey)
  - [![Code Quality](https://codeclimate.com/github/krainboltgreene/whiskey.png)](https://codeclimate.com/github/krainboltgreene/whiskey)
  - [![Build Status](https://travis-ci.org/krainboltgreene/whiskey.png)](https://travis-ci.org/krainboltgreene/whiskey)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/whiskey.png)](https://gemnasium.com/krainboltgreene/whiskey)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/whiskey/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/whiskey)

Whiskey is a [MUTE][MUTE] Engine.


Using Whiskey
=============

Once you've installed Whiskey you can start your new server with:

``` bash
$ whiskey server start
```

If you want to start whiskey on a specific port you'll need to specify like this:

``` bash
$ whiskey server start [-p|--port] 4001
```

The server defaults to running in development mode, but you can can also specify:

``` bash
$ whiskey server start [-e|--environment] production
```

If you want Whiskey to run in the background specify with:

``` bash
$ whiskey server start [-b|--background]
```

Any changes you make to the code will require reloading the server so to kill
the running server:

``` bash
$ whiskey kill all
```


Installing Whiskey
==================

**Requirements**:

  1. JVM 1.7+ (See [guide][JVMINSTALL])
  2. JRuby 1.7+ (See [guide][JRUBYINSTALL])
  3. Some Database (See [guide][DBINSTALL])

Install it using RubyGems:

    $ gem install whiskey

Now you can create your first project with:

``` bash
$ whiskey build whiskey_project
```

Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request
