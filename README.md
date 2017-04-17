# Airport Challenge

This project maps the workings of a simple airport. Airports can dock, build, and release planes; planes can take off and land; and there are limitations on when airports allow landings and take offs, such as during stormy weather, or if the airport is full. 

## Dependencies

You'll need Ruby to explore this project—instructions for getting it are available on ruby-lang's [installation page](https://www.ruby-lang.org/en/documentation/installation/). If you are on macOS or Linux, I recommend using [RVM](https://rvm.io).

If you haven't installed bundler, run `gem install bundler`, then navigate to the project root and run `bundle install`.

## Usage

The only way to run this project at present is in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/init.rb'`. You can then create planes and airports, and experiment with landings and takeoffs.



## Running tests

To run tests, simply navigate to the project root and use `rspec`.

## Other notes

Created as my first weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.
