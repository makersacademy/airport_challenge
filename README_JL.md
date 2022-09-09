## Airport Weekend Challenge

# How to install
Fork this repo, and clone to your local machine
Run the command gem install bundler (if you don't have bundler already)
When the installation completes, run bundle

# How to Run
Open IRB
Require all .rb files.

# How to test your code
Run RSpec from the Airport directory.

# Introduction

This project is the weekend task following the first week at Makers Academy.
The project comprises the simulation of an airport where the user is an air traffic controller. The main
methods available to the user are:
    - land_plane, which adds a plane to the airport
    - take_off(plane), which removes a specific plane from the airport

The methods above have been written to react to further variables, such as capacity in the airport and 
weather.

# Motivation

The motivation behind this project is to develop an understanding of how to Test Drive the writing of the 
program. The general process when writing this code was to create feature and unit tests using IRB/ RSpec
and then write code that will satisfy the test, using error messages as guides. 

# Brief

The following user stories were provided:

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

# Brief Interpretation

The following Classes and Mehtods were derrived from the user stories:

  Airport Controller (user)
  Plane (Class)
  Airport (Class)
    land_plane
    take_off
    check_weather
  Weather (Class)

# Steps

Several steps have been derrived from each of the user stories, to methodically build out tests and code.
These steps are written below with commentary and some example feature tests:

	1) As an air traffic controller; So I can get passengers to a destination ;I want to instruct a plane to 
  land at an airport

		a. Create airport class
		b. Pass plane into airport, using land_plane. Plane needs to be stored in airport (put inside instance 
      variable).
		c. Create plane class
		d. Update 'b' to accept instances of plane. - ended up writing this to create new instances of plane 
      rather than accepting it as an argument.

	2) As an air traffic controller; So I can get passengers on the way to their destination; I want to 
  instruct a plane to take off from an airport and confirm that it is no longer in the airport

		a. Create take_off method

			jimmylyons@Jimmys-MBP airport % irb
			3.0.2 :001 > require './lib/plane.rb'
			 => true 
			3.0.2 :002 > require './lib/airport.rb'
			 => true 
			3.0.2 :003 > airport = Airport.new
			 => #<Airport:0x000000015982e358> 
			3.0.2 :004 > airport.land_plane
			 => #<Plane:0x000000015a1e1c38> 
			3.0.2 :005 > airport.planes_in_airport
			 => #<Plane:0x000000015a1e1c38> 
			3.0.2 :006 > airport.planes_in_airport.takeoff
			(irb):6:in `<main>': undefined method `takeoff' for #<Plane:0x000000015a1e1c38> (NoMethodError)
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
			3.0.2 :007 > 

		b. Ensure that plane leaves airport when plane takes off (instance variable should be empty)
		c. Ensure that only specific instances of Plane that are in the airport can take off - not sure how to 
      do this

	3) As an air traffic controller: To ensure safety; I want to prevent landing when the airport is full

			jimmylyons@Jimmys-MBP airport % irb
			3.0.2 :001 > require './lib/plane.rb'
			 => true 
			3.0.2 :002 > require './lib/airport.rb'
			 => true 
			3.0.2 :003 > airport = Airport.new
			 => #<Airport:0x000000011b01d080> 
			3.0.2 :004 > land_plane
			(irb):4:in `<main>': undefined local variable or method `land_plane' for main:Object (NameError)
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
				from /Users/jimmylyons/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
			3.0.2 :005 > airport.land_plane
			 => #<Plane:0x000000011a85fca8> 
			3.0.2 :006 > airport.land_plane
			 => #<Plane:0x000000011b025af0> #--> keeps landing planes past capacity of 1
		
		a. Ammend land_plane, so that when the airport (instance variable) is full, the plane cannot land

	4) As the system designer; So that the software can be used for many different airports; I would like a 
    default airport capacity that can be overridden as appropriate

		a. Ammend airport instance variable to array and set max capacity to a new instance variable - will 
      need to update previous tests
		b. Add a method to change capacity

	5) As an air traffic controller; To ensure safety; I want to prevent takeoff when weather is stormy

		a. Will need to create something like is_stormy? - Need to create random weather generator - should 
      this be new class Weather?
			
      jimmylyons@Jimmys-MBP airport % irb
			3.0.2 :001 > require './lib/weather'
			 => true 
			3.0.2 :002 > weather = Weather.new
			 => #<Weather:0x0000000130272870 @weather="rainy"> 
			3.0.2 :003 > weather = Weather.new
			 => #<Weather:0x0000000130367a28 @weather="sunny"> 
			3.0.2 :004 > weather = Weather.new
			 => #<Weather:0x000000011982f040 @weather="sunny"> 
			3.0.2 :005 > weather = Weather.new
			 => #<Weather:0x000000011983fcb0 @weather="sunny"> 
			3.0.2 :006 > weather = Weather.new
			 => #<Weather:0x000000011986cad0 @weather="sunny"> 
			3.0.2 :007 > weather = Weather.new
			 => #<Weather:0x000000013025cc50 @weather="sunny"> 
			3.0.2 :008 > weather = Weather.new
			 => #<Weather:0x0000000130366588 @weather="sunny"> 
			3.0.2 :009 > weather = Weather.new
			 => #<Weather:0x000000011982dda8 @weather="rainy"> 
			
		b. Modify take_off so that if weather is stormy, then plane cannot take-off.

	6) As an air traffic controller; To ensure safety; I want to prevent landing when weather is stormy 
    
    a. Modify land_plane so that when weather is stormy, plan cannot land. 

# Key Thoughts and Issues

	• I can't get failure messages to work when I run RSpec. For some reason all the syntax I try keeps 
    failing.
	• I think that take_off and land_plane should have check_weather as part of their methods, but then I 
    had no way to control the weather in my tests. I suppose that I can assume that the user will check 
    the weather before take off or landing.
    I could probably refactor to get the above to work, but I think I would end up making my code less 
    concise.
