Airport Challenge
=================
<a href='https://coveralls.io/github/ayanit1/airport_challenge?branch=master'><img src='https://coveralls.io/repos/github/ayanit1/airport_challenge/badge.svg?branch=master' alt='Coverage Status' /></a> <a href="https://travis-ci.org/ayanit1/airport_challenge"><img src="https://travis-ci.org/ayanit1/airport_challenge.svg?branch=master"></a>

Synopsis
========
This is our first weekend challenge set at Makers. Our task was to produce software from a client request to control the flow of planes at an airport. All code was written with test first and all are passing

Example of how to run code
==========================
```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fe91a89cc58 @capacity=20, @planes_in_airport=[]>
2.2.3 :003 > plane = airport.add_plane
 => #<Plane:0x007fe91a88eec8>
2.2.3 :004 > airport.take_off(plane)
#<Plane:0x007fe91a88eec8> is no longer in airport => #<Plane:0x007fe91a88eec8>
2.2.3 :005 > plane.land?
 => nil
2.2.3 :006 > airport.land(plane)
#<Plane:0x007fe91a88eec8> has landed => [#<Plane:0x007fe91a88eec8>]
```
My approach to solving the challenge
====================================
I first began reading all material given, mainly focusing on the user stories and what the client wanted. Then began drawing a domain model to map out how I believe things will be structured and possible methods that may be required. After, I tried to prioritise the user stories seeing if any were linked or wether one would have to be done before the other. Now was the time to focus on one user story. The process would be run feature test in irb, discover the feature that would need to be create, create a unit test. Red-Green-Refactor. Once I complete writing sufficient simple code, I would run another feature test, and then move on to the next user story. 

What I would do if I had more time?
===================================
Unfortunately I still had some code to write to test out edge cases to which I would’ve then moved on to more refactoring and spend time making my code more elegant.

Issues I faced
==============
- In my design I initially thought that I would have a weather class. I was going through the users and automatically wrote down weather class as a possibility. It behaviour was to send wether or not it was stormy to prevent planes from landing/taking off. When I actually got to the step after focusing on the earlier ones. I realised after writing a couple tests, I was struggle to decide what code to write, and I remembered that if code doesn’t flow then there must be a issue with the design. My problem was, was that I want to refer to a instantiated weather object with the argument  of weather conditions = “storm” but when it came to trying to ask receive that message in another class, scope denied it. It couldn’t see it. Had to think about it and, I was fairly sure that I need to look at it, in a different way. I could’ve implanted some kind of weather method in airport but weather in actual fact has nothing to do with an airport. In real life its sort of a behaviour that could be share amongst many things. Now i’ve been reading POODR and I recall in ch 7, the mention modules. I need something that could send messages to classes that I didn’t have to instantiate and modules was the answer I came across. I was familiar with what they were so I did more reading and research and perfect. Weather was truly a behaviour that possibly be shared amongst many things in our scenario, even to plane…in the future of course, but I need a method that would return whether its stormy or not to be used in the Airport class. Further my understanding, Procs are similar to modules, but are put into blocks. Also taught me about the hierarchy class -> prepended modules -> objects class -> included modules -> superclass 

- Laying out files? where does feature test file go?

- I have trouble spelling receive

- understanding double concept. What made it difficult was couldnt apply it to a situation that i could recognise 
- learning about test doubles, (stunt doubles)
set known return values
fake method implementations
set expectations about calls to an object
double / mock is a simple object preprogrammed with expectations and responses as preparation for the calls it will receive
- stub instruction to an object to return a specific response to a method call
when you say hey you say ho 
fake method

- I had trouble trying to go through specific behaviours for my feature test

- Do I want to use a Proc in Rspec, I have several test using similar methods. Answer is I would use before do


Author
======
Albert 

