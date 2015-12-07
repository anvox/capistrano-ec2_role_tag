# Capistrano::Ec2RoleTag

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]
[![Coverage Status][CS img]][Coverage Status]

## Description

Extend capistrano in AWS EC2 by getting private dns name of servers by stage, role

```ruby
allhost = ec2_by_role("appworker")
allhost = ec2_by_role("backgroundworker")
```

## Installation

`$ gem install capistrano-ec2_role_tag` or add to your [Gemfile][] this line: `gem 'capistrano-ec2_role_tag'` then run [bundle install][]

## Usage

Just `require 'capistrano-ec2_role_tag'` in `Capfile` and then use it as:

### As a fancy tool

TODO

## Contributing

1. Fork it ( https://github.com/heosuax/capistrano-ec2_role_tag/fork )
2. Make your feature addition or bug fix and create your feature branch.
3. Update the [Change Log][].
3. Add specs/tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, create a new Pull Request.
5. Check that your pull request passes the [build][travis pull requests].

## License

Released under the MIT License. See the [LICENSE][] file for further details.

## Links

[RubyGems][] | [Documentation][] | [Source][] | [Bugtracker][] | [Build Status][] | [Dependency Status][] | [Code Climate][]


[bundle install]: http://gembundler.com/v1.3/man/bundle-install.1.html
[Gemfile]: http://gembundler.com/v1.3/gemfile.html
[LICENSE]: LICENSE.md
[Change Log]: CHANGELOG.md

[RubyGems]: https://rubygems.org/gems/capistrano-ec2_role_tag
