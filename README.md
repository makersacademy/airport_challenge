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


Getting started
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

How my app looks like from a user perspective
--

```rb
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> require './lib/plane.rb'
=> true
[3] pry(main)> require './lib/passenger.rb'
=> true
[4] pry(main)> passenger = Passenger.new(true, false)
=> #<Passenger:0x00007fdc3690d750 @luggage=true, @on_plane=false, @ticket=true>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x00007fdc39ba4088 @flying=true, @on_board=[], @plane_capacity=100>
[6] pry(main)> airport = Airport.new
=> #<Airport:0x00007fdc39bcd118 @airport_capacity=20, @hangar=[]>
[7] pry(main)> passenger.drop_luggage
=> "Luggage dropped!"
[8] pry(main)> airport.land(plane)
=> "Plane has landed!"
[9] pry(main)> plane.board(passenger)
=> "Passenger on board!"
[10] pry(main)> airport.take_off(plane)
=> "Plane has taken off!"
[11] pry(main)> airport.land(plane)
=> "Plane has landed!"
[12] pry(main)> plane.disembark(passenger)
=> "Passenger has disembarked!"
[13] pry(main)> passenger.collect_luggage
=> "Luggage collected!"
[14] pry(main)> exit
```



My approach to solving this challenge
---
1. I created an Airport class from where a plane can land and take off
  - Using TDD:
    - I tested that an instance of the Airport class can be created with a capacity
    - I tested that the airport capacity can be overridden
    - I tested that a plane can land and take off from an instance of
  the Airport class
    - After implementing all basic functionality, I drove out edge cases to ensure that my code could run in a predictable way in unpredictable circumstances such as:
        - plane cannot land or take off if weather is stormy or if airport is full

      - plane cannot land/take off if already landed/taken off
      - etc...


2. I created a Plane class that lets a passenger board and disembark
      - Using TDD:

        - I tested that an instance of the Plane class can be created with a flying and plane capacity arguments
        - I tested that the plane instance of the Plane class  knows if it is flying
        - I tested that the plane capacity can be overridden
        - I tested that the plane lets a passenger board and disembark  
        - After implementing all basic functionality, I drove out edge cases to ensure that my code could run in a predictable way in unpredictable circumstances such as:

           - A plane prevents a passenger from boarding a plane if they don't have a ticket or are already on board or if the plane is full
           - A plane prevents a passenger disembarking a plane if plane is flying or if they are not on board
           - etc...



3. I created a Passenger class that can drop and collect luggage

  - Using TDD:

    - I tested that an instance of the Passenger class can be created a ticket and on_plane arguments
    - I tested that a passenger can drop and collect luggage
    - After implementing all basic functionality, I drove out edge cases to ensure that my code could run in a predictable way in unpredictable circumstances such as:

      - A passenger cannot drop a luggage if they don't have a ticket
      - A passenger cannot drop/collect luggage if already dropped/collected
      - etc...


4. I added strings that are returned when an action has completed successfully (e.g: Plane has landed!). This was done for better user experience but in a real system, a user wouldn't be directly using these strings.

5. I added a feature test to ensure that all my components integrate properly.
