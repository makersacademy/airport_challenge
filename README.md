# Airport Challenge
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
## The Challenge
The challenge was to test drive the creation of a set of 
classes/modules to satisfy the following user stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport 
and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different 
airportsI would like a default airport capacity 
that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy
```
The code is expected to defend against edge cases, 
and there was a bonus challenge to write an RSpec 
feature test that lands and takes off a number of planes.

## My Approach

I took care to use a test-driven approach, starting out 
by performing feature tests in IRB, then writing simple 
unit tests, and getting them to pass in the simplest 
way possible, and slowly increasing the complexity 
in increments, following the same procedure.

Once I felt I'd met the user story specifications 
and edge cases, I refactored and retested, 
correcting where necessary. 
I repeated these steps a few times until I felt I 
couldn't do more.

I wrote a little method to generate a weighted array 
of weather types so that I wouldn't have to
write out lots of different weather states
which I've included in the Weather module;
I was toying with leaving it out, but I thought 
it might be nice for the user to be able to change 
the frequency of weather types.

## Example of Usage
```
3.0.2 :001 > require './lib/plane'
 => true 
3.0.2 :002 > require './lib/airport'
 => true 
3.0.2 :003 > airport = Airport.new
 => #<Airport:0x000000011180d290 @capacity=10, @hangar=[], @weather=:clear> 
3.0.2 :004 > plane = Plane.new
 => #<Plane:0x0000000123980700 @flying=true> 
3.0.2 :005 > airport.land(plane)
 => [#<Plane:0x0000000123980700 @flying=false>] 
3.0.2 :006 > small_airport = Airport.new(2)
 => #<Airport:0x0000000123a1b778 @capacity=2, @hangar=[], @weather=:clear> 
3.0.2 :007 > 2.times { small_airport.land(Plane.new) }
 => 2 
3.0.2 :008 > small_airport.land(Plane.new)
/Users/victoriablack/projects/weekend_challenges/airport_challenge/airport_challenge/lib/airport.rb:37:in `land': No clearance to land: Airport is full (RuntimeError)
        from (irb):8:in `<main>'
        from /Users/victoriablack/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/victoriablack/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/victoriablack/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

## Things to Improve

- When a plane takes off, @flying doesn't change to true
```
3.0.2 :009 > airport.takeoff(plane)
 => #<Plane:0x0000000123980700 @flying=false>
```
        - Fixed this error, I'd called plane.land 
        instead of plane.takeoff, d'oh!
- I feel like I haven't gotten to grips with doubles 
and stubbing, and have had to add in ad hoc objects 
to prevent unwanted error messages in tests, 
e.g. the new Plane object in
```
it 'removes plane that takes off from planes array' do
  plane = Plane.new
  clear_airport.land(plane)
  clear_airport.takeoff(plane)
  expect(clear_airport.hangar).to_not include(plane)
end
```
        - Fixed ad hoc additions of objects by using 
        let(:object) { Object.new }
- I feel like it could be a lot DRYer, particularly 
the spec tests
- I haven't gotten to grips with instance variables
and initialisation and I'm not sure if it would be
better for planes to be initialised like this:
```
def initialize(flying = true)
    @flying = flying
  end
```
or like this:
```
def initialize
    @flying = true
end
or some other way.
- I think it would be more realistic to have planes
start on the land instead of in the air!! 
I will fix this when I have time to go through
the spec file and correct for it