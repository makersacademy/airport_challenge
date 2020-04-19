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

I have 2 classes in this ruby project - Plane and Airport. Both are in '/lib/airports.rb'. The instances of each class respond in the following way.

---------------------------------------------

heathrow = Airport.new(50)
 - Argument will set the capacity of the hangar - defaults to 20.

heathrow.stormy?
 - replies true if stormy, false if not

heathrow.weather_update(true)
 - sets weather as stormy (use argument false to set as not stormy)

heathrow.hangar
 - this is an array of plane objects

---------------------------------------------

plane = Plane.new(heathrow)
 - Argument is airport plane starts in
 - Errors if airport hanger is full.
 - Defaults to 'SKY' if no location given.

plane.land(heathrow)
 - will land at heathrow if no error
 - errors if too stormy to land
 - errors if Airport hangar full
 - errors if already at an airport

plane.takeoff
 - will takeoff from the airport it is currently sat in if there are no errors
 - errors if stormy
 - errors if not currently in an airport

plane.takenoff?
 - a way of checking the planes location - responds true if in the sky, false if in airport.

---------------------------------------------

passes all Rspec tests - fails a couple of rubocop ones where I was unsure how to improve the syntax


