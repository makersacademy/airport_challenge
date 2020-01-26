Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____) # neeeeowwwwwwwmmmm
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Task
-----
The first weekend challenge of many to come, this task was based on writing software to control flow of planes at an airport. They should be able to land and take off given certain conditions are met, like the weather being adequate.
Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

The Approach
-----
Test-Driven Development led the way on this project, following the `RED-GREEN-REFACTOR` protocol. This meant that tests were written first, then code was written to meet the bare minimum the test was requiring. If necessary, refactoring was done afterward. To ensure this was done properly, I maintained a high test coverage to make sure there weren't areas I wasn't testing. For the tests themselves, the Ruby RSpec library was used, which provides extensive syntax to write intelligent tests.

How to Use
-----
1. Fork and clone the repository
2. navigate into the parent file that contains `spec` and `lib` folders
3. run `irb -r './lib/airport.rb` - this will require the file necessary to run the software.
4. Start by initializing a new airport (`airport = Airport.new(<capacity>)` perhaps?)
5. Initialize a plane to fly! (`plane = Plane.new(false)`)

Libraries and Software
----
Ruby version 2.6.3
rspec-core - 3.9.1 - For testing
Rubocop - 0.71.1 - For styling tips
