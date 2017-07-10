Airport Challenge
=================

```
        ______
        _\____\___					...And don't call me Shirley!
=  = ==(____MA____)							\
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

##My Approach
I decided to impliment most of the functionality within the Airport class as it seemed like the most logical place. Each instance of an airport would have methods responsable for the take off and landing of any planes it currently held, as well as checking the weather (which would be unique to each airport). The planes themselves would only hold a variable responsible for tracking their current location.


##Usage
Add the class files to your code and create instances of the plane and airport classes as you normally would:

```ruby
require 'plane'
require 'airport'

my_plane = Plane.new
my_airport = Airport.new
```
Airports will receive a default capacity of 20, but you can declaire a different capacity when you first create an instance of one if you like:

```ruby
my_airport = Airport.new(30)
```
Each airport instances is assigned a random weather value upon creation, stored as a boolean (true for stormy weather, false for anything else)
