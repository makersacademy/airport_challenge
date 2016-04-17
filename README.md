[![Build Status](https://travis-ci.org/letianw91/airport_challenge.svg?branch=master)](https://travis-ci.org/letianw91/airport_challenge)

[![Coverage Status](https://coveralls.io/repos/github/letianw91/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/letianw91/airport_challenge?branch=master)


#Personal Apporach


Here's the steps I've taken to finish the task.


##Domain Models

I created domain models for each user story.

e.g For the first story:

| Objects      | Messages   |
| ------------ | ---------- |  
| Airport      | land(plane)| 
| Plane        | land       |   

##RSpec tests

Based on the domain models and user stories, I wrote RSpec tests based on the domain models and described behaviors. e.g. For the abovementioned domain
model, I wrote a test for the Airport class stating that when an airport calling the #land method, the Airport should send a message to the plane. The airport should also confirm that the plane is parked in its hangar. To adhere to SRP, I used a spy to confirm that the airport has sent a message. For the plane class, I tested that when receiving a #land message, it will change its status to not flying

##Coding

Based on the test failing, I started writing my code and aimed for changing the error message each time until the test can past.

##Refactoring

After all tests for a user story had passed, I tried to refactor both the tests and the library to remove redundant code and to make the code more readable. Then I ran RSpec test again to make sure the tests still passed

##Feature test

I ran a feature test in irb for the implemented story to ensure the code worked in "real" situations.

I iterated through these steps for each of the user stories.

##Defending against edge cases

After having implemented all stories, I looked at the edge cases and wrote tests for defending against each of the cases (That I think needed to be defended against in my design). I then went through the BDD cycle to implement the code and made sure they passed unit and feature tests.

##Major decisions that I made
* Whether to use a separate class for weather, to make a Weather module and mixin, or just create a weather method within Airport?

   I think any of the three decisions could work for the time being as the weather class is fairly simple. As a model of reality, I think it makes more sense for the airport to get the weather from an external source so I used a separate class WeatherStation. 

* I injected the WeatherStation class into the Airport at initialization to achieve dependency inversion. This enabled me to use a double to test the Airport class to eliminated the randomness and avoided requiring the WeatherStation Class in the test. 

##Major Problems that I have

* It seems that I cannot defend against some of the listed edge cases. For example:  

   > planes that are already flying cannot takes off and/or be in an airport.  

   I cannot test or defend against the latter half of this case because as it stands, a plane does not know whether it is in an airport nor which airport it is in.

   > planes that are landed cannot land again and must be in an airport.  

   Same problem with plane not knowing whether it is in an airport.

   It is possible to pass the airport to the plane when an airport instructs the plane to land. The plane can then store the airport as an instance variable. But there is still no way of actually triggering the conflict between #flying? and being in an airport until another airport instructs the plane to land. It is possible to implement this defence but it just does not make much sense to me.

* It is necessary to make Airport#hangar public in order to test that the plane is actually parked into the hangar. This, however, exposed the hangar as a public interface and I don't know whether I made a good decision to do so.


##Running Example
```ruby
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x00000001ab7df8 @hangar=[], @capacity=20, @weather=#<WeatherStation:0x00000001ab7dd0>> 
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x00000001aacb88 @flying=true> 
2.2.3 :003 > airport.land(plane)
 => [#<Plane:0x00000001aacb88 @flying=false>] 
2.2.3 :004 > airport.land(plane)
RuntimeError: Stormy weather! Do not land!
2.2.3 :005 > airport.take_off(plane)
 => #<Plane:0x00000001aacb88 @flying=true> 

```
