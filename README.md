# Guard::Maven

Guard::Maven automatically packages maven when files are changed

## Installation

Add this line to your application's Gemfile:

    gem 'guard-maven'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-maven

## Usage

Currently the development is far from done, right now you should be able to add the following to a Guardfile in the root of your maven project:

    guard :maven, all_on_start: true do
      watch(%r[src/main/.*\.java$]) { 'all' }
      watch(%r[src/test/.*/(.*)\.java$]) { |m| m[1] }
      watch(%r[src/.*/resources/.*\.\w+$]) { 'all' }
    end

and it will run all tests when any code changes, and the relevant tests when just that test changes and notify you of the results

## TODO
Support modules in a clean way, so that you can do something like:

    guard :maven, all_on_start: true do
        Maven.module('my-project',dependencies: ['base-library'])
        Maven.module('base-library') do
            watch(%r[blah/image.jpg])
        end
    end

And normal maven changes, or a change to blah/image.jpg will cause an install of base-library and clean package of my-project. Changes inside of my-project will not cause a rebuild of base-library.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
