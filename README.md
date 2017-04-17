# Airport Challenge

This project maps the workings of a simple airport. Airports can dock, build, and release planes; planes can take off and land; and there are limitations on when airports allow landings and take offs, such as during stormy weather, or if the airport is full. 

## Dependencies

You'll need Ruby to explore this project—instructions for getting it are available on ruby-lang's [installation page](https://www.ruby-lang.org/en/documentation/installation/). If you are on macOS or Linux, I recommend using [RVM](https://rvm.io).

You will also need `bundler`—if you haven't installed it, run `gem install bundler`. Then navigate to the project root and run `bundle install`—which will install any missing project dependencies.

## Usage

This project is run in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/init.rb'`. You can then create planes and airports, and experiment with landings and takeoffs, as below:

```
[1] pry(main)> require './lib/init.rb'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f9ac8ba2c40
 @capacity=5,
 @climate=#<Climate:0x007f9ac8ba2c18 @possible_conditions=[:sunny, :sunny, :sunny, :stormy]>,
 @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f9ac8bdb1f8>
[4] pry(main)> airport.dock_plane(plane)
=> "Plane has landed."
[5] pry(main)> airport.dock_plane(Plane.new)
=> "Plane has landed."
[6] pry(main)> airport.dock_plane(Plane.new)
=> "Plane has landed."
[7] pry(main)> airport.dock_plane(Plane.new)
=> "Plane has landed."
[8] pry(main)> airport.dock_plane(Plane.new)
=> "Plane has landed."
[9] pry(main)> airport.dock_plane(Plane.new)
RuntimeError: Error: Landing not possible when airport is full.
from /Users/adc/makers_projects/airport_challenge/lib/airport.rb:27:in `dock_plane'
[10] pry(main)> airport.capacity = 10
=> 10
[11] pry(main)> airport.dock_plane(Plane.new)
=> "Plane has landed."
[12] pry(main)> airport.dock_plane(Plane.new)
RuntimeError: Error: Landing forbidden when weather is stormy.
from /Users/adc/makers_projects/airport_challenge/lib/airport.rb:28:in `dock_plane'
[13] pry(main)> airport.release_plane(plane)
=> "Plane is in the air."
```

## Running tests

To run tests, simply navigate to the project root and use `rspec`.

## Challenges

### Testing

Because I was still getting to grips with the testing syntax, TDD was a struggle during this project. I was often unclear on how to define the behaviour I wanted, and much of the weekend was spent learning more about RSpec.

### Domain Modelling

It was a challenge figuring out which object I should call my `land` method on. At first, I tried to call it on instances of `Plane`, but could not write the tests for this approach. I was using doubles, and I had to check that a `plane` had been saved to an airport's `@planes` array after landing. I could find no way to do this using doubles, and I decided RSpec was trying to tell me something! My inability to write the test with doubles suggested my `airport`s and `plane`s would be overly dependent on one another unless I made a change, so I decided that airports should `dock_planes` instead of having planes `land_at` airports. 

### Features

I experimented with RSpec's built-in feature capabilities this week. However, I don't think I used them very well, and I look forward to learning more about feature testing in weeks to come.

## Other notes

Created as my first weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.
