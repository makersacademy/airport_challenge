Airport Challenge
=================

This application simulates an Air Traffic Controller landing and releasing planes from and Airport
There are three Classes: Aeroplanes, Airports, and Air Traffic Controllers.

Classes
-------
-Aeroplanes
  * Have a flight status
  * Have a location of nil if airborne and airport instance if grounded

-Airports
  * Have hangars with a capacity
  * Can land an aeroplane
  * Can release a plane

-Air Traffic Controllers
  * Inherit from the Airport Class
  * Are supplied with an airport to control
  * Can be assigned a different airport
  * Can check the weather
  * Can change flight status
  * Can check an airports hangar
  * Redefines #land and #take_off to check conditionals (stormy weather, full hangar, etc.)

Aeroplanes
----------
Aeroplanes have a flight status of either "grounded" or "airborne", as well as a location set to the airport they occupy or nil if in the air
These are changed by the Air Traffic Controller when planes lands or takes off


Airport
-------
Airports have basic control over planes, commanding them to land and take off
Airports will not check weather conditions or hangar status when commanding planes

```ruby
def land(plane)  
    hangar << plane
end
```

Air Traffic Controller
----------------------
Air Traffic Controllers inherit the Airport class and will check conditions before approving flight landing and take off

```ruby
def land(plane)
    raise "Stormy weather preventing landing" if stormy?
    raise "Airport Full" if hangar_full?
    raise "Plane already landed at airport" if hangar_include?(plane)
    ground_plane(plane)
end
```
They can be assigned different instances of Airports to control, only one at a time.

```irb
2.5.0 :009 > heathrow = Airport.new
 => #<Airport:0x00007fe63b1783f0 @capacity=200, @weather="clear", @hangar=[]>
2.5.0 :010 > gatwick
 => #<Airport:0x00007fe63b1da3e8 @capacity=500, @weather="clear", @hangar=[]>
2.5.0 :011 > tom = AirTrafficController.new(heathrow)
 => #<AirTrafficController:0x00007fe63b132a30 @airport=#<Airport:0x00007fe63b1783f0 @capacity=200, @weather="clear", @hangar=[]>>
2.5.0 :012 > tom.airport = gatwick
 => #<Airport:0x00007fe63b1da3e8 @capacity=500, @weather="clear", @hangar=[]>
2.5.0 :013 >
```


Tests
-----

Rspec tests for Air Traffic Controller are dependent on Aeroplane instances, when landing an aeroplane the Controller changes the aeroplane status to "grounded", which was difficult to emulate with Mocking

Weather was stubbed to ensure conditions were correct for tests

```ruby
context "when Airport.weather is 'clear'" do
  before(:each) do
    subject.airport.weather = "clear"
  end
  ...
end
```