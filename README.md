Airport Challenge
=================



Task
-----

This challenge was to write a piece of software to control the flow of planes at an airport, adhering to the requirements of a set of user stories.

User Stories
-------------

1. As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

2. As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3. As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

4. As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

5. As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

6. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate


User Story 1
-------------

The first user story requires interaction between two new objects, Plane and Airport.

My first decision was whether to create a land method for the Plane or Airport class. I decided to go with the Plane using the land method because I felt that ```plane.land(airport)``` would make more sense to the user.

The land method takes the airport as the parameter and returns it when called on a plane.

Next I created the landed? method, which uses the instance variable landed to return a boolean. This is initialized to false when the place is created, and is set to true by the land method.

User Story 2
-------------

Before starting on this story I did some refactoring. I decided that the landed? method was superfluous and instead kept the landed state of the plane in an attribute reader.

My first step was to implement the take\_off method for the Plane class. When called ```plane.take_off``` it changes the @landed variable from true to false.

To confirm that the plane is no longer at an airport, I created an airport attribute reader. This is initialized to :flying when the place is created. I then updated the land method to change @airport to the airport passed in. When take_off is called, it resets the @airport variable back to :flying.

User Stories 3 and 4
---------------------

To implement the requirements of these 2 user stories, I decided to create a Weather class to handle the generation of random weather.

One of the decisions I had to make was whether to base the current weather around the plane or the airport. I decided to go with initializing airport with a weather object as I felt it made more real world sense.

Next I changed the land and take_off methods in the plane class to raise an error if the weather at the airport they are trying to land at is stormy.

User Stories 5 and 6
---------------------

I started with user story 6. I thought it'd be simpler to first test for/implement an airport capacity that can be initialized and changed and then make sure that it can't be exceeded.

I set the capacity using an attr\_reader capacity in the Airport class. I then used a constant DEFAULT\_CAPACITY to set a default capacity of 10. Lastly I changed the initialize method to set @capacity to the default capacity unless a parameter was passed in upon creating of a new Airport.

To prevent planes landing at full airports, I created a private method full?. This checks that the airport planes array isn't at capacity and is used to raise an error if it is.


Instructions for use
---------------------

Below is an irb transcript showing how to use the program. 

```
2.2.3 :001 > require './lib/plane.rb'
 => true 
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x000000012818f0 @weather=#<Weather:0x000000012818c8>, @capacity=10, @planes=[]> 
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x000000012770d0 @landed=false, @airport=:flying> 
2.2.3 :004 > plane.land(airport)
 => #<Airport:0x000000012818f0 @weather=#<Weather:0x000000012818c8>, @capacity=10, @planes=[:plane]> 
2.2.3 :005 > plane.take_off
RuntimeError: Too stormy to take off
        from /home/ubuntu/workspace/Projects/airport_challenge/lib/plane.rb:35:in `take_off_errors'
        from /home/ubuntu/workspace/Projects/airport_challenge/lib/plane.rb:19:in `take_off'
        from (irb):5
        from /usr/local/rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :006 > plane.take_off
 => :flying 
2.2.3 :007 > small_airport = Airport.new(1)
 => #<Airport:0x0000000122afa0 @weather=#<Weather:0x0000000122af50>, @capacity=1, @planes=[]> 
2.2.3 :008 > plane2 = Plane.new
 => #<Plane:0x00000001075430 @landed=false, @airport=:flying> 
2.2.3 :009 > plane.land(small_airport)
 => #<Airport:0x0000000122afa0 @weather=#<Weather:0x0000000122af50>, @capacity=1, @planes=[:plane]> 
2.2.3 :010 > plane2.land(small_airport)
RuntimeError: Airport full
        from /home/ubuntu/workspace/Projects/airport_challenge/lib/plane.rb:29:in `landing_errors'
        from /home/ubuntu/workspace/Projects/airport_challenge/lib/plane.rb:13:in `land'
        from (irb):10
        from /usr/local/rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
```