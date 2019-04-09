Airport Challenge
=================

This challenge was set as our first weekend challenge of the Makers Academy course. It enabled me to practice transforming user stories into usable code using test driven development, as well as improve my Ruby skills generally and become more comfortable with OOP and encapsulation.

Steps to run this program
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Using this program
-------

This is an example of how you could use this program in irb. You will need to `require` the `airport.rb` file first:
```
irb
require './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.landed?
airport.take_off(plane)
```

My Approach
---------

At the beginning of the challenge, I was given the following tasks and user stories. I have explained my approach to problem solving under each individual user story below:

"We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:"

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
I decided that I would need an Airport class and a Plane class. I would then need method to land a plane(object) in the airport(object).

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
I created a method that enabled the user to instruct planes to take off from the airport. In order to confirm that the plane is no longer at the airport, I created methods in the Plane class to set the state of the plane. This way I would be able to record that the plane has taken off and is now set to "flying".

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
In order to ensure that the Single Responsibility Principle was adhered to, I wanted to create a separate Weather class which randomised weather instances. I wanted it to be more likely that it would be a sunny day but with the chance of an occasional storm.

If there was a storm, the plane would be prevented from taking off. This would involve creating a method in the Airport class which would check whether or not the weather was stormy and an error being raised if it was. I used stubs in my testing to ensure that when it was stormy the plane would not take off.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
My approach here mirrored my approach when preventing take off during a storm. I used the same method in the Airport class to check the weather and raised an error to prevent landing if the weather was stormy. Again, I used stubs in my testing to ensure that when it was stormy the plane would not be able to land.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
Firstly I needed to decide what it would mean for the airport to be 'full'. Therefore I would need to set the capacity. Initially, I set the airport capacity as a number but later changed this to the constant 'DEFAULT_CAPACITY' so that this could be easily changed later if necessary.

I then created a predicate method in the Airport class which returned `true` if the airport was full  (i.e. the number of planes was equal to or greater than the DEFAULT_CAPACITY). I then raised an error that informed the planes the airport was too full for them to land.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
When initializing the Airport class, I passed an argument for setting the airport capacity using the constant `DEFAULT_CAPACITY`, which will be the default airport capacity if the user does not pass an argument. Therefore, my airport can be expanded later in the future.

I also defended against certain edge cases such as ensuring that planes could only take off if they were actually in the airport. To improve this code, I would defend against further edge cases by ensuring that planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc. I have already created methods in my Plane class which reflect the status of the Plane, so it would be a case of implementing these. 

What I learned from this challenge
-----
* How to use stubs in my tests
* Further practice with TDD and Rspec
* Defending against edge cases
* OOP and Encapsulation


Author/Acknowledgements
-----
Jordan Roberts
Makers Academy Challenge
