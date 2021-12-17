# Airport Challenge

This is the Makers week three solo challenge!

## Getting started

1. `git clone https://github.com/samhpickering/airport_challenge.git`
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle` inside the repo directory

## Usage

```
airport = Airport.new
plane = Plane.new

airport.land(plane)
airport.landed?(plane) # => true
plane.airborne         # => false
airport.takeoff(plane)
```

## Running tests

`rspec`