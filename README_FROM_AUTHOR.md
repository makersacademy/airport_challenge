
INSTRUCTIONS:

Fork this repo, and clone to your local machine
	git clone <url>
Run the command: gem install bundle
When the installation completes, run: bundle
In the Gemfile, ensure ruby version is 2.2.3 in order to run RSpec tests (from project root directory)
Ensure you open irb, or pry from the project directory.

ABOUT:		This is a project/challenge set by the coding bootcamp Makers Academy and then completed by the AUTHOR as a learning assignment.

		Consequently, all scripts not included in the 'lib' or 'spec' directory are the work of the staff at Makers Academy.
		This README therefore only relates to these two directories.

		The challenge is to build a simple air traffic control program that fulfills the following user stories:

USER STORIES:

		As an air traffic controller
		So I can get passengers to a destination
		I want to instruct a plane to land at an airport and confirm that it has landed

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

USAGE GUIDE:

Only Airports are allowed to instruct Planes to land or take off
Remember to park newly created planes at your chosen airport before instructing them to take off
There is a 10% chance bad weather will prevent landing and taking off

CLASSES:

Airport

Instantiates with two arguments, a capacity and weather.
Capacity defaults to a constant DEFAULT_CAPACITY of 20.
Weather defaults to an injected instantiation of the Weather class.

	Methods:

	airport.land(plane)
		Will not allow a plane to land if the airport is full.
		Will not allow a plane to land if the weather is not sunny.
		Will not allow a plane to land if the plane has already landed and isn't flying.
		Otherwise, it will change the plane's status to 'landed' and put the plane in the holding bay.

	airport.take_off
		Will not allow a plane to take off if airport is empty.
		It will otherwise remove the plane from the holding bay in order to check it's status.  
		It will not allow a plane to take off if it is already flying or if the weather is not sunny and put it back in the holding bay.
		Otherwise it will then change the plane's status from Landed to Flying as it takes off.

	Private Methods:

	full?
		Will check if the holding bay is bigger than or equal to the airport's capacity.

	empty?
		Will check if the holding bay is empty.

	Att_reader:
	holding_bay
	capacity
	sunny
		Is inherited from a new instance of the weather class as either true or false.
		* It would be nice to add capability for the weather to change without having to instantiate a new Airport. This would be more true to the real world problem we are modeling, where a plane could land and whilst sunny but be prevented from taking off because the weather changes from sunny to stormy. 

Weather

Is in basic form at present and can be expanded on to include other weather types.

Instatiates with no arguments

	Methods:
		sunny? - is a random weather generator that has 20% chance of being sunny and returning true.
		Attr_reader:
		sunny

Plane

Instantiates with one argument, status.
Status defaults to :Flying as when the airport becomes aware of a Plane.new it will always be flying before it can land.

	Methods:
		change_status
		landed?
		flying?
		Attr_reader
		status

$ irb feature test
> require './lib/airport'
> airport1 = Airport.new
> aiport2 = Airport.new
> plane1 = Plane.new
> plane2 = Plane.new
> airport.land(plane1)
> heathrow.land(plane2)
> heathrow.take_off(plane1)
> heathrow.take_off(plane2)
> jfk.land(plane1)
> jfk.land(plane2)


LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com

PROJECT CONTENTS:	Gemfile
			Gemfile.lock
			Rakefile
			README.md - a description of the challenge set by MakersAcademy
			lib directory
				airport.rb
				plane.rb
				weather.rb
			spec directory
				airport_spec.rb
				plane_spec.rb
				weather_spec.rb
