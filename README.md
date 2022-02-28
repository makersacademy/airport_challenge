Airport Challenge
=================

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

Walkthrough
---------

I have provided a walkthrough of the steps taken to complete this challenge, my thought processes, the challenges faced and my overall takeaways. Please [take a look](https://github.com/adamwoodcock98/MakersPortfolio/blob/main/Evidence/Airport%20Challenge.md) at this md file if you are interested.

Getting started
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

Instructions
---------

### Creating a new airport

To instantiate a new airport object, navigate to the project directory and start a new IRB requiring the `airport.rb` file:
```bash
adamwoodcock@Adams-MacBook-Pro airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x00007fb16e847e08 @capacity=20, @planes=[], @weather=#<Weather:0x00007fb16e847d40>> 
```
This creates a new airport object, initialising with a default capacity of 20 planes and a weather object. You can pass a custom weather object into this argument, though this is not necessary, nor will it provide additional functionality. See testing for mocked extreme weather examples.

### Landing a plane

To land a plane at an airport, you will need to create a plane object.
```bash
adamwoodcock@Adams-MacBook-Pro airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > plane = Plane.new
 => #<Plane:0x00007ff2a617e5a8> 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x00007ff2a61bdff0 @capacity=20, @planes=[], @weather=#<Weather:0x00007ff2a61bdf28>> 
3.0.2 :003 > airport.land(plane)
 => [#<Plane:0x00007ff2a617e5a8>] 
```

#### Viewing stored planes
You can use the `planes` getter methods to view the planes currently stored at the airport.
```bash
adamwoodcock@Adams-MacBook-Pro airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x00007fdfe90cd430 @capacity=20, @planes=[], @weather=#<Weather:0x00007fdfe90cd318>> 
3.0.2 :002 > 3.times { airport.land(Plane.new) }
 => 3 
3.0.2 :003 > airport.planes
 => [#<Plane:0x00007fdfe9845230>, #<Plane:0x00007fdfe9844718>, #<Plane:0x00007fdfe9844628>] 
```

### Instructing planes to take off

You can use the `take_off` method to instruct planes to leave the airport
```bash
adamwoodcock@Adams-MacBook-Pro airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > plane = Plane.new
 => #<Plane:0x00007f8338876528> 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x00007f833517f948 @capacity=20, @planes=[], @weather=#<Weather:0x00007f833517f880>> 
3.0.2 :003 > airport.land(plane)
 => [#<Plane:0x00007f8338876528>] 
3.0.2 :004 > airport.take_off(plane)
 => #<Plane:0x00007f8338876528> 
3.0.2 :005 > airport.planes
 => [] 
```

Testing
-------

The program contains a series of tests using Rspec (this library should be installed if the steps above were followed)

To run all tests across all class files, do the following:

```bash
cd Navigate/to/project/directory

rspec
```

To run tests for a specific class file, do the following:

```bash
cd Navigate/to/project/directory

rspec spec/airport_spec.rb
# or
rspec spec/weather_spec.rb
```
> Weather dependant tests mocks the behaviour of storms to ensure the planes do not land or take off in these conditions.

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
