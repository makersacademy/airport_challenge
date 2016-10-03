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

---------

Set each of the user stories to a test and then built the code one by one to match
work them through.

Tests need to be refactored further to include 'doubles' and 'before', but all works
depending on when the weather sample returns 'sunny' or 'stormy'.

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f8edc2f9780 @planes=[], @specified_capacity=1, @weather=#<Weather:0x007f8edc2f9730>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f8edc2a3588 @flying=true>
[4] pry(main)> airport.land?(plane)
=> "Plane has landed"
[5] pry(main)> airport.take_off?(plane)
=> "Plane has taken off"
```
