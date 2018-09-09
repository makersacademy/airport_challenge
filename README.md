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

Steps
-------

1. Clone to your local machine
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

Our task was to write a program that satisfied each of these user stories. My program was able to effectively answer each problem, with a key focus on **Test-Driven Development** as well as **Refactoring**.

One strength that appeared whilst solving this challenge was being able to break down the problem into smaller, more clearer goals. I realised that, at a glance, that a program like this feels very enormous and challenging, yet when I wrote a test that simply checked if I was able to create an instance of an Airplane class, it felt satisfying making a smaller step. By keeping this methodical approach, I was able to write a program that focused on solving the tests I wrote alongside. As a result, my test coverage is at 100%, showing evidence of both TDD and solving problems.

However TDD was a double-edged sword in this challenge. A great weakness that appeared was testing multiple classes at once. A lot of the weekend was spent learning on my own and trying to understand dependency injection. I believe I have a lot to improve on and will have that as a explicit goal when continuing my learnings in Makers. I also struggled to write the tests that dealt with randomness. With more research I started gathering evidence that  there are simpler ways of writing the random weather code. I decided to keep it, because I think it will be good review to discuss it with coaches and peers.

Some examples of the code working in the terminal: 

```bash
[1] pry(main)> Heathrow = Airport.new
=> #<Airport:0x00007fa556204d08 @default_capacity=20, @plane_hanger=[]>
[2] pry(main)> Gatwick = Airport.new
=> #<Airport:0x00007fa55619f610 @default_capacity=20, @plane_hanger=[]>
[3] pry(main)> Canadian_Airlines = Airplane.new
=> #<Airplane:0x00007fa556909568 @flying_status=true>
[4] pry(main)> Heathrow.weather
=> "Fly away, baby"
[34] pry(main)> Gatwick.weather
=> "Stormy"
```
```bash
[36] pry(main)> British_Airways = Airplane.new
=> #<Airplane:0x00007fa556a8c098 @flying_status=true>
[37] pry(main)> Heathrow.land(British_Airways)
=> [#<Airplane:0x00007fa556a8c098 @flying_status=false>]
[38] pry(main)> Gatwick.land(Canadian_Airlines)
RuntimeError: Sorry, theres a storm.
from /Users/alexkharouk/Desktop/Makers/weekend-challenges/airport_challenge/lib/airport.rb:32:in `stormy?`
[39] pry(main)> Gatwick.weather
=> "Fly away, baby"
[40] pry(main)> Gatwick.land(Canadian_Airlines)
=> [#<Airplane:0x00007fa556909568 @flying_status=false>]
[41] pry(main)> Heathrow.land(Canadian_Airlines)
RuntimeError: Sorry, this plane already landed at an airport.
from /Users/alexkharouk/Desktop/Makers/weekend-challenges/airport_challenge/lib/airport.rb:41:in `already_landed?`
```

