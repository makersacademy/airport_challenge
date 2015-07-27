Airport Challenge
=================

Introduction
------------

After the first week at Makers Academy, we were tasked with creating a working airport model for the weekend challenge. Provided with the user stories found below, we were asked to use test driven development to create the classes, methods and rspec tests required to allow several typical airport functions.


User Stories
------------

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```
Nouns
* pilot
* air traffic controller
* plane - has status (flying / grounded)
* airport

Verbs
* land
* take off
* check if full?
* check if stormy?

airport <-- take off --> plane (status == flying)
airport <-- landing --> plane (status == grounded)
airport <-- full? --> true / false
airport <-- stormy? --> true / false

Instructions
------------

Simply run from irb and require the airport.rb file

```
require 'lib/airport.rb'
irb
```

In Development
--------------

* Tidying up of airport_spec.rb to more clearly test the weather/storminess
* Adding functionality to plane.rb to allow planes to have a 'flying'/'grounded' status
* Adding functionality to airport.rb to change planes status

Author
------

Toby Clarke