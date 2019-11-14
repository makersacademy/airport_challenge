Airport Challenge
=================

My first weekend challenge was to create a simple application that allowed users to create airports and planes, advise those planes to land and take off all whilst accounting for a the weather. The user stories were as follows-

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

The application has 3 classes - a Plane class that allows you to land planes, a Airport class that allows you to takeoff and a Weather class that generates a random number between 1 and 10 every time it is instantiated. This then determines the weather and whether the plane is able to land or take off. 

The application is fully tested using Rspec and can be easily run from the terminal.

### Screenshots

<img src="images/plane_class.png?" width="400px">

A screenshot of the plane class - notice how the plane class holds the 'land' method

<img src="images/weather_class.png?" width="400px">

An weather class with an SRP - return a random weather variable

<img src="images/tests.png?" width="400px">

The test spec for the airport class

<img src="images/14_passing_tests.png?" width="400px">

14/14 passing tests

Technologies Used
-----

* Ruby
  * I built my application with Ruby - using the command line to allow users to build their own airports and planes
* Rspec
  * My testing framework was rspec - my final test suite had 14/14 passing tests

A Sample of the IRB
-----

```
2.6.0 :001 > require './lib/airport.rb'
2.6.0 :002 > require './lib/plane.rb'
2.6.0 :003 > require './lib/weather.rb'
2.6.0 :004 > gatwick = Airport.new
 => #<Airport:0x00007f9aaa079af8 @capacity=20, @plane_array=[]> 
2.6.0 :005 > virgin = Plane.new
 => #<Plane:0x00007f9aaa0aa568 @has_landed=false> 
2.6.0 :006 > easyjet.land(gatwick, Weather.new)
 => [#<Plane:0x00007f9aab845a10 @has_landed=true>] 
2.6.0 :007 > gatwick.takeoff(easyjet, Weather.new)
 => #<Plane:0x00007f9aab845a10 @has_landed=false> 
2.6.0 :025 > gatwick.takeoff(easyjet, Weather.new)
RuntimeError (Sorry - this plane is not at the airport)
2.6.0 :035 > easyjet.land(gatwick, Weather.new)
RuntimeError (Sorry - poor weather) # The application gives this error 1/10 times as per the Weather class
```


Installation
-----

* Git clone the project into your own local repository
* Run bundle install in order to download the relevant gems
* Run irb in your local repo in order to start the application
* Add the following into you IRB IRB

```
2.5.0 :001 > require './lib/takeaway.rb'
2.6.0 :002 > require './lib/plane.rb'
2.6.0 :003 > require './lib/weather.rb'

```

Tests
-----

After bundle install has been run you will be able to run rspec to test the application. Just run rspec in your terminal to do so.