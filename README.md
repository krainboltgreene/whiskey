whiskey
-------

  - [![Quality](http://img.shields.io/codeclimate/github/krainboltgreene/whiskey.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/whiskey.gem)
  - [![Coverage](http://img.shields.io/codeclimate/coverage/github/krainboltgreene/whiskey.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/whiskey.gem)
  - [![Build](http://img.shields.io/travis-ci/krainboltgreene/whiskey.gem.svg?style=flat-square)](https://travis-ci.org/krainboltgreene/whiskey.gem)
  - [![Dependencies](http://img.shields.io/gemnasium/krainboltgreene/whiskey.gem.svg?style=flat-square)](https://gemnasium.com/krainboltgreene/whiskey.gem)
  - [![Downloads](http://img.shields.io/gem/dtv/whiskey.svg?style=flat-square)](https://rubygems.org/gems/whiskey)
  - [![Tags](http://img.shields.io/github/tag/krainboltgreene/whiskey.gem.svg?style=flat-square)](http://github.com/krainboltgreene/whiskey.gem/tags)
  - [![Releases](http://img.shields.io/github/release/krainboltgreene/whiskey.gem.svg?style=flat-square)](http://github.com/krainboltgreene/whiskey.gem/releases)
  - [![Issues](http://img.shields.io/github/issues/krainboltgreene/whiskey.gem.svg?style=flat-square)](http://github.com/krainboltgreene/whiskey.gem/issues)
  - [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
  - [![Version](http://img.shields.io/gem/v/whiskey.svg?style=flat-square)](https://rubygems.org/gems/whiskey)


Whiskey is a [MUTE](MUTE) Engine.


Using
=====

Once you've installed Whiskey you can start your new server with:

``` bash
$ whiskey server start
```

If you want to start whiskey on a specific port you'll need to specify like this:

``` bash
$ whiskey server start [--port 4001]
```

The server defaults to running in development mode, but you can can also specify:

``` bash
$ whiskey server start [--environment production]
```

If you want Whiskey to run in the background specify with:

``` bash
$ whiskey server start [--background]
```

Any changes you make to the code will require reloading the server so to kill
the running server:

``` bash
$ whiskey server kill
```


Installing
==========

Add this line to your application's Gemfile:

    gem "whiskey", "~> 1.0"

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install whiskey


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request


Changelog
=========

  - 1.0.0: Initial release


Conduct
=======

As contributors and maintainers of this project, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

We are committed to making participation in this project a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual language or imagery, derogatory comments or personal attacks, trolling, public or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct. Project maintainers who do not follow the Code of Conduct may be removed from the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by opening an issue or contacting one or more of the project maintainers.

This Code of Conduct is adapted from the [Contributor Covenant](http:contributor-covenant.org), version 1.0.0, available at [http://contributor-covenant.org/version/1/0/0/](http://contributor-covenant.org/version/1/0/0/)


License
=======

Copyright (c) 2014, 2015 Kurtis Rainbolt-Greene

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
