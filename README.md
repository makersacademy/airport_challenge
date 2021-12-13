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
        UserStory --> FeatureRed -->
                until Feature == Green
                        UnitRed-->UnitGreen-->Refactor-->UnitGreen
                end
        FeatureGreen --> Refactor --> FeatureGreen
end
```

You can try out the results for yourself. Forget flight simulators, now you can experience an air traffic control simulator!

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
Create airports, capacity will default to one, so do add your own:
```ruby
3.0.2 :003 > aua = Airport.new
 => #<Airport:0x00007f8e14a00880 @capacity=1, @hangar=[]> 
3.0.2 :004 > mbj = Airport.new(42)
 => #<Airport:0x00007f8e149e96a8 @capacity=42, @hangar=[]> 
3.0.2 :005 > bda = Airport.new(13)
 => #<Airport:0x00007f8e1215e170 @capacity=13, @hangar=[]> 
3.0.2 :006 > nas = Airport.new(7)
 => #<Airport:0x00007f8e1201a0c0 @capacity=7, @hangar=[]> 
```
Create you planes on the system and send them to flight:
```ruby
3.0.2 :007 > boeing747 = Plane.new
 => #<Plane:0x00007f8e149a8c48 @location="In Flight"> 
3.0.2 :010 > bombardierCRJ200 = Plane.new
 => #<Plane:0x00007f8e149c1630 @location="In Flight"> 
```
Land planes at the airports:
```ruby
3.0.2 :011 > boeing747.land(aua)
 => #<Airport:0x00007f8e14a00880 @capacity=1, @hangar=[#<Plane:0x00007f8e149a8c48 @location=#<Airport:0x00007f8e14a00880 ...>>]> 
```
Airports will alert you if full:
```ruby
3.0.2 :012 > bombardierCRJ200.land(aua)
/Users/You/airport_challenge/lib/airport.rb:17:in `receive': Sorry, Hangar Full (RuntimeError)
```
You may also have to try later or elsewhere if the weather is stormy:
```ruby
3.0.2 :025 > bombardierCRJ200.takeoff
/Users/You/airport_challenge/lib/airport.rb:30:in `weather_warning': Sorry, Runways Closed, Storms Approaching (RuntimeError)
```