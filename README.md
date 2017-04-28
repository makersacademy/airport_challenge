# Airport Challenge
```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

This project maps the workings of a simple airport. Airports can dock, build, and release planes; planes can take off and land; and there are limitations on when airports allow landings and take offs, such as during stormy weather, or if the airport is full. 

## Dependencies

You'll need Ruby to explore this project—instructions for getting it are available on ruby-lang's [installation page](https://www.ruby-lang.org/en/documentation/installation/). If you are on macOS or Linux, I recommend using [RVM](https://rvm.io).

You will also need `bundler`—if you haven't installed it, run `gem install bundler`. Then navigate to the project root and run `bundle install`—this will install any missing project dependencies.

## Usage

This project is run in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/init.rb'`. You can then create planes and airports, and experiment with landings and takeoffs, as below:

```
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f9ac8ba2c40
 @capacity=5,
 @climate=#<Climate:0x007f9ac8ba2c18 @possible_conditions=[:sunny, :sunny, :sunny, :stormy]>,
 @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f9ac8bdb1f8>
[4] pry(main)> airport.dock_plane(plane)
=> "Plane has landed."
[5] pry(main)> airport.release_plane(plane)
RuntimeError: Error: Take-off forbidden when weather is stormy.
from /Users/adc/makers_projects/airport_challenge/lib/airport.rb:36:in `release_plane'
```

## Running tests

To run tests, simply navigate to the project root and use `rspec`.

## Challenges

### Testing

Because I was still getting to grips with the testing syntax, TDD was a struggle during this project. I was often unclear on how to define the behaviour I wanted, and much of the weekend was spent learning more about RSpec.

### Domain Modelling

It was a challenge figuring out which object I should call my `land` method on. At first, I tried to call it on instances of `Plane`, but could not write the tests for this approach. I was using doubles, and I had to check that a `plane` had been saved to an airport's `@planes` array after landing. 

I could find no way to do this using doubles, as I needed to check that `plane.land_at(airport)` both changed `plane.land` to `true`, and saved `plane` to `airport.planes`. I decided RSpec was trying to tell me something! My inability to write the test with doubles suggested my `airport`s and `plane`s would be overly dependent on one another unless I made a change, so I decided that airports should `dock_planes` instead of having planes `land_at` airports. 

With hindsight, I could have perhaps tested that 
1. `airport` received a `save_plane` message with one argument when `plane.land_at(airport)` was called, and
2. `airport` saved `save_planes`'s argument (the plane) when it received that message.

However, I still don't know how I'd have checked that a `plane` passed itself as an argument when calling `save_plane` on `airport`.

### Features

I experimented with RSpec's built-in feature testing capabilities this week. However, I don't think I used them very well, and I look forward to learning more about feature testing in weeks to come.

## Other notes

Created as my first weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.
