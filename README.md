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

For this challenge my approach to solving it was TDD. If I got stuck on something
I first tried to figure it out on my own, next I turned to google, loving
stack-overflow. If I still couldn't solve it, then I turned to the review code
section.

I managed to get all the features working, however, upon implementing a guard clause
to fail if stormy? my stud didn't always equate stormy? to false.

This lead to a lot of problems with further tests as I still couldn't always
ensure it was clear, meaning I couldn't land planes to get to the airport to be
in the state I needed it.

However, through manual feature tests I managed to get all the features working.
Here are the needed command to run the program:
- airport = Airport.new(capacity) (DEFAULT_CAPACITY is set to 10)
- plane = Plane.new
- airport.land(plane)
- airport.take_off(plane)
