# Poise-Derived Cookbook

[![Build Status](https://img.shields.io/travis/poise/poise-derived.svg)](https://travis-ci.org/poise/poise-derived)
[![Gem Version](https://img.shields.io/gem/v/poise-derived.svg)](https://rubygems.org/gems/poise-derived)
[![Cookbook Version](https://img.shields.io/cookbook/v/poise-derived.svg)](https://supermarket.chef.io/cookbooks/poise-derived)
[![Coverage](https://img.shields.io/codecov/c/github/poise/poise-derived.svg)](https://codecov.io/github/poise/poise-derived)
[![Gemnasium](https://img.shields.io/gemnasium/poise/poise-derived.svg)](https://gemnasium.com/poise/poise-derived)
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

A [Chef](https://www.chef.io/) cookbook for defining lazily evaluated node
attributes.

## Quick Start

To create a lazily evaluated node attribute:

```ruby
# attributes/default.rb
default['mycookbook']['version'] = '1.0'
default['mycookbook']['url'] = lazy 'https://example.com/myapp-%{mycookbook.version}.zip'
```

This attribute can now be used anywhere a normal string can be used and will
lazily evaluate to the derived value.

## Requirements

* Chef >= 12.3

## Block Attributes

When simple format strings are not enough, you can use the block form of lazy
attributes:

```ruby
# attributes/default.rb
default['mycookbook']['memory_percent'] = 50
default['mycookbook']['command_options'] = lazy {
  "-m #{node['memory']['total'].to_i * node['mycookbook']['memory_percent'] / 100.0}"
}
```

If the block returns something other than a string, it will be run through `to_s`.

## Sponsors

Development sponsored by [Bloomberg](http://www.bloomberg.com/company/technology/).

The Poise test server infrastructure is sponsored by [Rackspace](https://rackspace.com/).

## License

Copyright 2016, Noah Kantrowitz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.