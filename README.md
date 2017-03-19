# Airport Challenge

![Travis CI](https://travis-ci.org/kittysquee/airport_challenge.svg?branch=master)

This is my work for the week one weekend challenge for [Makers Academy](www.makersacademy.com).

In this I firstly made an Airport class which handled the planes landing and taking off. I was going to initially make a plane class but I decided that the actions happening were to the Airport itself.

Then I decided to make a Weather class as this is variable and is not a condition that is directly affecting the airport, rather sometimes the condition of the weather can affect the action of the airport class.

I attempted to use TDD best practice whilst writing this code, test first, code after.

I used simplecov to allow me to see if I was covering all of the methods within my tests, which I appear to be. I also used Rubocop to ensure that I was writing good Ruby code.

### Installation Guide

Clone repository:
```
$ git clone git@github.com:makersacademy/airport_challenge.git
```

Install dependencies:
```
$ cd airport_challenge
$ gem install bundler
$ bundle install
```

To run Rubocop:
```
$ rubocop
```

To run simplecov:
In `spec_helper.rb` add the following:
```
require 'simplecov'
SimpleCov.start
```
and comment out the following:
```
require 'coveralls'
Coveralls.wear!
```
Then run `rspec`
