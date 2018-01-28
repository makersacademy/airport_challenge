# Airport Challenge

Completed this as the first weekend challenge at Makers Academy.

This program emulates software for air traffic controllers to control the flow of planes at an airport.

## How to use

I am Ruby Version 2.5.0

```
irb -r './lib/plane.rb'

```

### Sample output

```
Lauras-MBP:airport_challenge lwkchan$ irb -r './lib/plane.rb'
2.5.0 :001 > heathrow = Airport.new
 => #<Airport:0x00007fc85d91dfc0 @planes=[], @weather=#<Weather:0x00007fc85d91def8 @weather=:fine>, @capacity=20>
2.5.0 :002 > boeing747 = Plane.new
 => #<Plane:0x00007fc85d990610>
2.5.0 :003 > Luton = Airport.new(30)
 => #<Airport:0x00007fc85d9826f0 @planes=[], @weather=#<Weather:0x00007fc85d982678 @weather=:fine>, @capacity=30>
2.5.0 :004 > boeing747.land(Luton)
 => #<Airport:0x00007fc85d9826f0 @planes=[#<Plane:0x00007fc85d990610 @current_airport=#<Airport:0x00007fc85d9826f0 ...>>], @weather=#<Weather:0x00007fc85d982678 @weather=:fine>, @capacity=30>
2.5.0 :005 > boeing747.take_off
Plane has left airport => nil

```

### To test

```
rspec

```

## Task

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

## My approach

1. With user stories, I sketched out a simple domain model. This helped me work out what messages
I wanted to send to each object I needed.

| Object | Messages |
| ------ | ---------|
| plane  | land     |
|        | take off |
| airport | has max. capacity |
|         | has local weather conditions |

2. From here, I expanded my domain model and thought more broadly about the relationships between the plane and the airport. E.g. When a plane could land in the airport, when a plane could take off etc.

3. Then, I wrote each unit as a test in rspec first. Failed the test, then wrote the code. I completed this cycle with each unit, starting from the easiest (e.g. landing a plane in fine weather) to the hardest (e.g. giving the airport a variable capacity)

4. Once happy with all my unit tests, I went on to test these as features in irb. For this, I used the user stories to double check the client would be satisfied.

5. Finally, I thought of possible edge cases which I should test against (e.g. making sure a flying plane could not )

6. For defending against these edge cases, I followed the steps detailed in step 3.

7. Finally, having tested the code fully on irb, I went through the code and refactored my methods to make sure every class and method had a single responsibility.
