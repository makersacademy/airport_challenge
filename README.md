# airport_challenge

This program controls the flow of planes at an airport. The planes can land and take off when the weather is sunny but cannot land and take off when it is stormy.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Install RSpec:

```
gem install rspec
```

Setup the project to use RSpec:

```
rspec --init
```

For RSpec documentation, visit http://rspec.info/documentation.

### Installing

Clone the program to your local directory:

```
git clone https://github.com/ker-an/airport_challenge.git local_directory
cd local_directory
```

## Running Tests

Create an airport with planes:

```
$ irb
2.4.0 :001 > require "./lib/airport"
  => true
2.4.0 :002 > airport = Airport.new
  => #<Airport:0x007f9387045778 @hangar=[], @capacity=10, @weather=#<Weather:0x007f93870456d8>>
2.4.0 :003 > plane1 = Plane.new
  => #<Plane:0x007f938702eb68>
2.4.0 :004 > plane2 = Plane.new
  => #<Plane:0x007f93871bfb08>
 ```

 Planes can land and take off, except in stormy weather:

 ```
2.4.0 :005 > airport.land(plane1)
  => "Plane has landed"
2.4.0 :006 > airport.land(plane2)
  => "Plane has landed"
2.4.0 :007 > airport.take_off(plane1)
  RuntimeError: Stormy weather, plane unable to take off
2.4.0 :008 > airport.take_off(plane1)
  => "Plane has taken off"
2.4.0 :009 > airport.hangar.include?(plane1)
  => false
2.4.0 :010 > airport.hangar
  => [#<Plane:0x007f93871bfb08>]
 ```

Plane cannot land if it's already in the hangar:

```
2.4.0 :011 > airport.land(plane2)
  RuntimeError: Plane already landed
```

Plane cannot take off if it's already in the air:

```
2.4.0 :012 > airport.take_off(plane1)
  RuntimeError: Plane already taken off
```

Planes are unable to land if the airport reaches it's default capacity of 10:

```
2.4.0 :025 > airport.land(plane11)
  RuntimeError: Airport at full capacity, plane unable to land
```

The airport's default capacity of 10 can be overridden:

```
2.4.0 :002 > airport = Airport.new
  => #<Airport:0x007fcbda0456e8 @hangar=[], @capacity=10, @weather=#<Weather:0x007fcbda045670>>
2.4.0 :003 > airport.capacity = 5
  => 5
2.4.0 :004 > airport
  => #<Airport:0x007fcbda0456e8 @hangar=[], @capacity=5, @weather=#<Weather:0x007fcbda045670>>
```

## Built With

```
Ruby 2.4.0
```

## Author

[Keran Braich](https://github.com/ker-an)
