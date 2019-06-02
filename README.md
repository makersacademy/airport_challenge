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

Notes on How I Solved the Problem
---------------------------------

I realised half way through that I'd probably over-engineered the solution. I'd kept a record of all the planes at the airport, in an airport variable, but probably only needed to store the number of planes at the airport, and for the plane to know if it was at the airport or not. I refactored some of the tests to reflect this.

I then simplified even further realising that the spec didn't ask for knowledge of which airport the plane was at! So changed to a boolean at_airport?

I also added a Controller class to handle requests for take off and landing.

Rubocop has been used to spot any code quality issues.
I've used a test double for Weather to test it's behaviour.

I haven't managed to test many edge cases due to time pressure.
I also haven't managed to do refactoring of my tests for the same reason.

Questions
---------

How should I access internal attributes for testing? I've added attribute writers but this didn't seem quite right.