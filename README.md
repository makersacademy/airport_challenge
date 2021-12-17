Airport Challenge (Orla Dunlop)
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

Introduction
---------
This challenge was completed at the end of **Week 3** of the Makers Apprenticeship course over the course of a day. The purpose of the challenge was to test my what I had learnt over the week about **Test Driven Development** and effective debugging.

User Stories
-----
Below are the six User Stories provided for thie challenge which will inform a lot of what is said below

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

My Approach
-------
### Design Decisions
Initially, it seemed the natural decision to give a Plane class the methods of #land and #take_off as they're things *planes* do not airports - I ended up giving these behaviours to the Airport class for two reasons:

1. From writing the unit tests for these methods it became clear that the output I needed to test to fulfill the requirements of the User Story needed to come from an instance of the Airport class 
2. The User Stories specify traffic controllers and a system desginer, **not** pilots - meaning I was designing functionality for their roles inside the airport (e.g. managing if planes land and/or take off).

In summary, whilst the methods #land and #take_off describe what we would typically view as actions belonging to planes, they actually describe the actions of the traffic controllers granting/denying a plane permission to land.

### TDD Process
* I began with the first user story - using the online tool Miro to identify what actions needed to be taken (i.e. what objects, what actions).
* I identified that the first thing my code needed was an aiport - I ran a feature test to see if this felt like the natural first step for this user story and once I confimed that I created my first unit in "airport_spec.rb" which described a class called Aiport.
* This first run of my unit test failed as no class called Airport existed - so I created a new file airport.rb and set up a new class Airport with no methods. Then my unit test passed.
* This was the process I continued to take: writing unit tests and allowing this to guide me and let my code develop organically.
* Each time I passed a test I ran rubocop.
* Each time I felt my code delivered what the user story asked for (by running a feature test to make sure I could do everything the user story asked for) - I commited my code.
* I would then return to Miro to begin on the next user story and repeat the above.

Instructions
-----

### Landing a Plane
To land a plane at an airport the following code can be used:
```
$ irb
3.0.2 :001 > gatwick = Airport.new
 => #<Airport:0x0000000148157b80 @planes=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000013180e490> 
3.0.2 :003 > gatwick.land(plane)
 => [#<Plane:0x000000013180e490>] 
```

However, there are **three** potential error messages a user might encounter... 

1. If the weather is too stormy:
```
The plane cannot land as it is too stormy (RuntimeError)	
```
2. If a plane that has already landed and is still in the airport tries to land:
```
This plane has already landed and is in the airport (RuntimeError)
```
3. If the the airport is full:
```
The plane cannot land as airport is at capacity (RuntimeError)
```

### Take Off 
The following code can be used to let a plane take off and check that it's no longer in the airport.
```
$ irb
3.0.2 :001 > gatwick = Airport.new
 => #<Airport:0x000000010f86c0a8 @planes=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000011f8815d8> 
3.0.2 :003 > plane2 = Plane.new
 => #<Plane:0x000000011eac1c18> 
3.0.2 :004 > gatwick.land(plane)
 => [#<Plane:0x000000011f8815d8>] 
3.0.2 :005 > gatwick.land(plane2)
 => [#<Plane:0x000000011f8815d8>, #<Plane:0x000000011eac1c18>] 
3.0.2 :006 > gatwick.take_off
 => #<Plane:0x000000011eac1c18> 
3.0.2 :007 > gatwick.gone?
 => true 
```

However, there are **two** potential error messages a user might encounter...
1. If the weather is too stormy:
```
It's too stormy for a plane to take off right now (RuntimeError)
```
2. There are no planes left at the airport in which the user will receive `nil`
```
$ irb
# Previous dialogue exlcuded for brevity
3.0.2 :027 > gatwick.take_off
 => nil 
 ```

### Overriding an Airport's Standard Capacity
The last bit of functionality is the ability to override the default capacity of an airport so that this programme can be used for airports of all sizes. The default is set to 20.

To override this a user can use the following code:
```
$ irb
3.0.2 :002 > gatwick.override_capacity(10)
/Users/orladunlop/Projects/Week-3/airport_challenge/lib/airport.rb:31: warning: already initialized constant Airport::CAPACITY
/Users/orladunlop/Projects/Week-3/airport_challenge/lib/airport.rb:5: warning: previous definition of CAPACITY was here
 => 10 
```