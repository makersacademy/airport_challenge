Airport Challenge
=================
This is the first Makers Academy weekend challenge, designed to solidify
our understanding of the concepts we learned and used during the first
week in the Boris Bikes exercise.

Approach
--------
My first attempt at a solution was too heavily influenced by the solution
to our previous challenge (Boris Bikes). The user stories for the airport
challenge specify that it must be possible to tell a specific plane to land or
take-off, but I missed this and instead defined those methods in the airport
class only. I realised my mistake and started again, re-drafting my
[domain model](https://github.com/thisdotrob/airport_challenge/blob/second-attempt/domain-model.md)
and going from there, this time starting with just the `Plane` class.

My second attempt is much more closely aligned to the user stories, as I did
my best to avoid scope creep and keep my code to the minimum required to meet
their requirements.

I decided to use a seperate class to implement the weather behaviour, with this
class containing a single class method #stormy? which returned true with a
probability of 1 in 10 as follows:

```ruby
def self.stormy?
  rand > 0.9
end
```

The `land` and `take_off` methods in the `Plane` class then called this class
method as follows:

```ruby
raise 'Too stormy.' if Weather.stormy?
```

I set the required behaviour in `Plane`'s rspec tests with the following
method stub:

```ruby
allow(Weather).to receive(:stormy?).and_return(false)
```

This line needed to be repeated in a number of `Plane`'s it, do.. end blocks
(not DRY) but I could not find a way to define the behaviour outside of an it
block which would have been preferable (i.e. once in the Describe block only).

Instructions
------------
To use this on a local machine:

1. Fork this repo and clone
2. run `gem install bundle` in the cloned base directory
3. run `bundle`
