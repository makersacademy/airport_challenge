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

Instructions
---------

1. Fork this repo and clone to your machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle` to download gems
4. Run `irb` and begin using your airport!

Start by initializing a new Airport and a new Plane.

The plane will start off on the ground, so run `airport.take_off(<your_plane>)` to get it in the air. It will not take off if the weather is stormy.

You can check the weather by calling `check_weather` on the Airport. This will let you know if the weather has changed to Sunny or if it's still Stormy.

After either taking off or landing your plane, the weather may change to Stormy so you might not be able to take off/land. There is a 1 in 4 chance the weather will change to from Sunny to Stormy so keep trying to take off/land and the weather may update!

If you try to "take off" whilst the plane is still in the air, or "land" the plane whilst it's still on the ground, you will receive an error message.

---------
**Example irb transcript:**
```
$ irb
2.2.3 :001 > require './lib/airport.rb'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007ff5fc916460 @weather=:Sunny, @capacity=1, @planes=[]>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007ff5fc8bd040 @landed_status=true>
2.2.3 :004 > airport.take_off(plane)
 => "#<Plane:0x007ff5fc8bd040> has taken off"
2.2.3 :005 > airport.check_weather
 => :Sunny
2.2.3 :006 > airport.check_weather
 => :Sunny
2.2.3 :007 > airport.check_weather
 => :Sunny
2.2.3 :008 > airport.check_weather
 => :Stormy
2.2.3 :009 > airport.land(plane)
 => "Unable to land plane in stormy weather"
2.2.3 :010 > airport.check_weather
 => :Sunny
2.2.3 :011 > airport.land(plane)
 => "#<Plane:0x007ff5fc8bd040> has landed"
```
---------
**Future Changes:**
I would like to learn and use doubles properly in order to make my tests for efficient.
I would also like to initially make a new instance of a plane belong to an Airport, and new planes can only be created if there is space for them.
I would also like to add a message to let the user know when the weather has changed from Sunny to Stormy or vice versa. E.g. "The weather is now Sunny so the plane can now take off/land".
