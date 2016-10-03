[![Build Status](https://travis-ci.org/kathwath/airport_challenge.svg?branch=master)](https://travis-ci.org/kathwath/airport_challenge)

Airport Challenge:

https://github.com/kathwath/airport_challenge.git

Files included:
airport.rb, plane.rb, weather.rb

airport_spec.rb, plane_spec.rb, weather_spec.rb

Description:

This build has been created in response to a request from a client to write the software to control the flow of planes at their airport.  The client stated that they wanted the following:

* Instruct a plane to land, and confirm it has landed;
* Instruct a plane to take-off, and confirm it has left the airport;
* Prevent planes from landing if the airport is full;
* Prevent planes landing, or taking off, if the weather is stormy;
* To be able to change the default capacity when necessary.

A TDD approach was used to create the software and used a combination of Rspec and Pry for testing; tests included both feature and unit type.

Below is an example of the code in action:

![alt tag](https://github.com/kathwath/airport_challenge/blob/master/Screenshot.png)


This demonstrates the ability to track the creation of an airport and plane, and check it lands, and then leaves the airport.

Note - whilst all tests in Rspec are passing, there is a problem with planes landing when stormy in pry.  I have spent a number of hours trying to fix this, but have not been able to resolve it.  I am to review this code with my pair/cohort members to establish why this is the case; I will then push the updated code to ensure full completion of this challenge. 
