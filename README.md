[![Build Status](https://travis-ci.org/mikehurl/airport_challenge.svg?branch=master)](https://travis-ci.org/mikehurl/airport_challenge)
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

INSTRUCTIONS
------------
1. Start pry (or irb) in your terminal
2. `require "./lib/airport"`
3. You can then create new airports (`Airport.new`), new aeroplanes (`Aeroplane.new`) and new weather conditions (`Weather.new`)
4. To land use call `land(plane)` on your new airport

The Challenge
-------------
The challenge is to create code that controls aeroplanes landing and taking off at airports; taking into account weather conditions.

The aeroplanes should be able to:
- take off
- land

The airport should be able to:
- prevent taking off and prevent landing in bad weather conditions (a storm)
- prevent landing if the airport is full

The airport should have:
- a default capacity that can be overwritten


My Solution
-----------
The code was created by first drawing out the objects and messages from the user story; followed by diagramming to determine which objects would respond to which messages.

  e.g.
    aeroplane <-- land (at an airport) --> airport

Following TTD principles, I used *pry* to test small features, before creating unit tests with *Rspec*, and then finally creating code to pass those tests.

I have implemented:
- most tests for 'Airport'
- one test for 'Aeroplane'
- code for 'Airport' that:
  - has a default capacity that can be overwritten
  - initializes with a capacity (default or otherwise)
  - raises an error when the airport is full
  - keeps a record of planes that have landed
- code for 'Aeroplane' to determine if the plane has taken off or not
- code for weather that randomly generates the weather condition to be stormy or not stormy


INCOMPLETE
----------

I have not completed the challenge. I would still like to implement some other functionality:
- 'Airport' knows if the 'Weather' is stormy or not
- change code that prevents planes landing when "not safe" to incorporate 'Airport' knowing the weather condition (currently it is considered "not safe" if the airport is empty as a quick workaround)
- test the weather conditions in *Rspec* using a stub
- test for and deal with edge cases
