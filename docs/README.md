Title of project
################

Airport Challenge - the aim of this project is to generate code to address 6 user stories (see User Stories below).  

Author
######

This code and README.md were prepared by Elaine Finn @ Makers Academy (Jan 2016 cohort).

Requirements
############

This project requires:

 - rspec

Installation
############

Rspec is installed by following the content in this link: https://github.com/rspec/rspec-rails

This Airport Challenge repo is cloned from: https://github.com/makersacademy/airport_challenge

Configuration
#############

The module has no menu or modifiable settings. There is no configuration.

Project Directories
###################

->doc directory - contains project set up, instructions
->lib directory - contains code (plane.rb + airport.rb)
->spec directory - contains rspec tests (plane_spec.rb + airport_spec.rb)

User stories
############

This project generates code to address the following user stories:

User story #1

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

User story #2

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

User story #3

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

User story #4

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

User story #5

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

User story #6

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

IRB demo of app
###############

2.2.3 :001 > require './lib/airport'
 => true 
2.2.3 :002 > require './lib/plane'
 => false 
2.2.3 :003 > airport = Airport.new
 => #<Airport:0x007ff2341ac678 @landed_planes=[]> 
2.2.3 :004 > plane = Plane.new
 => #<Plane:0x007ff234195a40> 
2.2.3 :005 > plane.land(airport)
 => #<Airport:0x007ff2341ac678 @landed_planes=[]> 
2.2.3 :006 > plane.takeoff(airport)
 => false 
2.2.3 :007 > plane.landed?
 => nil 
2.2.3 :008 > plane.airport?
 => nil 

Code status
###########

Completed User Stories 1, 2 (but for takeoff), and set up 3 and 4.

Copyright and Licensing
#######################

Copyright(c) 2016 Elaine Finn

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.