
"Welcome to air traffic control!

This ap will:

 .Create an airport with either default capacity or
    the ability to change it yourself
 .Won't let planes land or take off in Stormy weather
 .Won't let a plane land if it is in the airport
 .Won't let a plane take off that isn't in the airport
 .You can check the status of the plane (wether its flying or not)
 .You can also check which planes are inside the airport


[*********************************************************************] \n
        Create a default airport and plane like so:

2.2.3 :001 > require './lib/airport' \n
 => true \n
2.2.3 :002 > plane = Plane.new \n
 => #<Plane:0x007faf32019710 @passengers=241, @status=:Flying> \n
2.2.3 :003 > airport = Airport.new \n
 => #<Airport:0x007faf318b4ce0 @the_weather=:Cloudy, @runway=[], @capacity=5> \n

[*********************************************************************] \n
        Create an airport with your own capacity like so: \n
\n
2.2.3 :001 > require './lib/airport' \n
 => true \n
2.2.3 :002 > airport = Airport.new(24) \n
 => #<Airport:0x007fe1638bcb70 @the_weather=:Cloudy, @runway=[], @capacity=24> \n
2.2.3 :003 > plane = Plane.new \n
 => #<Plane:0x007fe163040f28 @passengers=176, @status=:Flying> \n

[*********************************************************************] \n
                    Basic commands: \n
\n
<airport>.land_plane(<plane>) - Lands the selected plane \n
<airport>.take_off(<plane>) - Selected Plane leaves the airport \n
<airport>.runway - gives list of planes on runway \n
<airport>.change_weather - this allows you to alter the weather if its stormy.. \n
<plane>.status - Plane's current status" \n
