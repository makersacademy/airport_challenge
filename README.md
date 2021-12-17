# Come Fly With Me

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

## Makers Week 1 Challenge
For my first weekend challenge at [Makers](https://www.makers.tech/) I was briefed with creating software to control the flow of planes at an airport. 

This was an oppurtunity to put into practice the vaulable skills we had learnt throughout the week. Such as BDD as roughly shown below:

```ruby
until UserStories == fulfilled
        user_story
        feature_test = :red
                until feature_test == :green
                        unit_test  = :red
                        unit_test = :green
                        refactor
                        unit_test == :green
                end
        refactor
        feature_test == :green 
end
```

I was working from the following user stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy  
```
You can try out the results for yourself. Forget flight simulators, now you can experience an air traffic control simulator!


## Installation

1. Fork this repo, and clone to your local machine
2. Run the command ```gem install bundler``` (if you don't have bundler already)
3. When the installation completes, run ```bundle```


## Running Tests

Run ```rspec```


## Usage

Change into lib directory and open irb. 
Require the following:
```ruby
You@YourComputer lib % irb
3.0.2 :001 > require './airport'
 => true 
3.0.2 :002 > require './plane'
 => true 
```
Add airports to the system, capacity will default to one, so do add your own:
```ruby
3.0.2 :003 > aua = Airport.new
 => #<Airport:0x00007fa8aca287d8 @capacity=1, @hangar=[], @weather_service=WeatherService> 
3.0.2 :004 > mbj = Airport.new(42)
 => #<Airport:0x00007fa8ab824640 @capacity=42, @hangar=[], @weather_service=WeatherService> 
3.0.2 :005 > bda = Airport.new(13)
 => #<Airport:0x00007fa8aca186a8 @capacity=13, @hangar=[], @weather_service=WeatherService> 
3.0.2 :006 > nas = Airport.new(7)
 => #<Airport:0x00007fa8af1c83b0 @capacity=7, @hangar=[], @weather_service=WeatherService> 
```
Add planes to the system:
```ruby
3.0.2 :007 > boeing747 = Plane.new
 => #<Plane:0x00007fa8af163348> 
3.0.2 :008 > bombardierCRJ200 = Plane.new
 => #<Plane:0x00007fa8aca6bc90> 
```
Check if a plane is in flight:
```ruby
3.0.2 :009 > boeing747.in_flight?
 => true
```
Planes that are in flight can land at the airports:
```ruby
3.0.2 :010 > boeing747.land(aua)
 => #<Airport:0x00007fa8aca287d8 @capacity=1, @hangar=[#<Plane:0x00007fa8af163348 @airport=#<Airport:0x00007fa8aca287d8 ...>>], @weather_service=WeatherService> 
```
Airports will alert you if full:
```ruby
3.0.2 :011 > bombardierCRJ200.land(aua)
/Users/You/airport_challenge/lib/airport.rb:13:in `receive': Sorry, Hangar Full (RuntimeError)
```
Planes in airports can takeoff, but you may have to try later if the weather is stormy:
```ruby
3.0.2 :012 > boeing747.takeoff
/Users/You/airport_challenge/lib/airport.rb:30:in `weather_warning': Sorry, Runways Closed, Storms Approaching (RuntimeError)
```