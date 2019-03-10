Airport Challenge
=================

My approach
---------

* I read the user stories and broke them down into things I need the programme to do
* For each line of "I want to be able to do this", I wrote the simplest test, fixed it, and repeated. I refactored my code every time the test passed.
* Every now and again I refactored tests to make them easier to read/find and to ensure they didn't do unnecessary steps
* Every now and again I ran rubocop to lint my code
* Once I had done enough tests to complete a particular thing the code should do, I check the user stories to make sure I was still following the brief

** line 7 of the weather class is not covered by a test. I have not worked out how to cover it.
** I have started the feature test but haven't worked out how to make it work with RSpec feature yet.

Reflection
-------

1. I didn't feature test anything in ```irb``` as I went. Would this have changed my design/approach at all?
2. I have written what I think is the cleanest, simplest code for the task that I have ever written. My concern - have I actually answered all of the brief?
3. My head just doesn't want to think up new edge cases!

How to run my code
-------

1. Run any of the test files to test the classes. ```airport_spec``` or ```weather_spec``` or ```plane_spec```
2. Run any of the commands in ```irb``` or a ruby file ```Airport.new``` ```Plane.new``` ```Weather.new```

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

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
