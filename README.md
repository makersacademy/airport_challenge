Airport Challenge
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
This is the week 1 challenge as part of the Makers Academy bootcamp. It is a program built in Ruby that enables to
planes to take-off and land at different airports subject to the weather not being stormy.
Prerequisites

-------
- You have installed Ruby

How to install
-------

1. Fork this repo, and clone to your local machine.
2. Run the command `gem install bundler` (if you don't have bundler already).
3. When the installation completes, run `bundle`.

Building the program
-------

- I modelled the task using the user stories in the brief. I listed the nouns and the verbs to create
a list of objects and messages. For example, I identified the plane object with the following messages:
'land', 'takeoff' and 'is at airport?'
- I then used Jam Board to map out the whole story of the planes, airports and weather conditions.
- Once I was happy with the structure, I began coding using TDD. First I did a feature test, then a failing
unit test and then wrote the method until they passed. I followed the red, green, refactor process.
- I made sure my tests covered all of the user stories plus the edge cases. I also added in a feature test at
end.
- I also made sure that I got 100% test coverages and that all my tests passed.

How to use this program
-------

- You will need to create at least one instance of the Airport class. You have the option of passing in capacity as an argument -
if not it will default to 5. A weather class will be instantiated each time a new Airport class is instantiated.
- You will also need to create at least one instance of the Plane class. You wil need to land a plane in an airport before you
it can take off from that airport.
- The Weather is randomly generated from an array which includes two scenarios: 'stormy' or 'sunny'.

-------
Below is an example of how to use the program:
```
2.6.5 :002 > my_airport = Airport.new
 => #<Airport:0x00007f97348f99e0 @planes=[], @weather=#<Weather:0x00007f97348f99b8>, @capacity=5> 
2.6.5 :003 > my_plane = Plane.new
 => #<Plane:0x00007f9734900c18 @landed=false> 
2.6.5 :004 > my_airport.land(my_plane)
 => true 
2.6.5 :005 > my_airport.take_off(my_plane)
 => false 
2.6.5 :007 > print my_airport.send(:planes)
[] => nil

```
User Stories
---------
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