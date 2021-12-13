# Airport-Challenge


### Description:


This software controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Please see user stories below. 

### Conditions:

Planes can only take off from airports they are already in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport.


### How to use:

Airport can instruct planes to land with the land(plane) method.

It raises two errors: 1) when the airport is full and has reached a maximum capacity of 10 planes 2) when the weather is stormy.

Airport can instruct planes to take off with the take_off(plane) method. 

This method can raise an error when airport instructs plane to take off during stormy weather. 


### Project Status : Incomplete

* To complete the weather feature, I would incorporate 'weather_forecast' as an argument such as def initialize(capacity, weather_forecast) <lib/airport.rb>. I would ccreated a double to the 'weather_forecast' within <spec/airport_spec.rb>.

* For User story 2 I would add a confirmation statement that confirms a plane is no longer in the airport. This could have been achieved
  by raising an error message such as 'Plane is no longer at airport: plane already flying'.


### User Stories

1. As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

2. As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3. As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

4. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

5. As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

6. As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

### References

##### Private method
https://www.rubyguides.com/2018/10/method-visibility/

##### Double method 
https://www.relishapp.com/rspec/rspec-mocks/docs

##### Random
https://blog.appsignal.com/2018/07/31/generating-random-numbers-in-ruby.html 

#### Stubs
https://relishapp.com/rspec/rspec-mocks/v/2-4/docs/method-stubs