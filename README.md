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

This is the first weekend challenge from the Makers Academy Web Development course - September 2016.

This was our task and user stories:

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
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
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

--
How to Install and Run Locally

Clone the repo to a local folder and in terminal run:

$> ch airport
$> irb
:001 require './lib/airport.rb'
Then you can use the methods described in the functional description

I created 3 different classes:
Airport
Plane
Weather

Airport Class

Airports have a number of essential properties, specifically:

capacity (defualt: 20 planes) [but the user can set the capacity if needs be]
landed planes logging (knows which planes are currently landed inside it).

An Airport can only land a plane while the airport is not full and has sunny local weather.

Similarly, an airport can only send off a plane if that plane is currently landed inside it and the local weather is not stormy.

The airport checks all the relevant conditions (including the current weather) automatically on every landing and taking off attempt

 - Airport Class Methods

Airport.new() - creates a new airport instance (defualt capacity: 20 planes).

Airport.new(capacity: 100) - creates a new airport instance with capacity of 200 planes.

Airport Instance Methods

.planes - returns an array containing details of all the planes which are currently landed in that airport.

.full? - returns true if airport is filled to capacity and false if not.

.land(plane) - lands a given plane if all landing conditions are met.

.take_off(plane) - sends off a plane if all relevant conditions are met.

Plane Class

Planes can have either flying or landed status (the defualt is flying when first created).

This status can be determined on initialization (true being flying or false being landed), as well as changed later by using the .landed or .flying methods.

A plane cannot land by itself in an airport. Rather, the airport is the one responsible for landing planes inside it (and this operation is weather and airport status depended).

Plane Class Methods

Plane.new() - creates a new plane instance (defualt 'flying' status)

Plane Instance Methods

.airborne? - returns true if the plan is in the air and false if it is on the ground.

.landed - changes plane's status to 'landed' if currently 'flying'

.flying - changes plane's status to 'flying' if currently 'landed'

Weather Class

The WeatherConditions module is responsible for generating random weather conditions.

These conditions may be either sunny or stormy, and they are set locally and independently for each airport instance.

The random distribution of possible weather conditions is significantly biased toward sunny weather (87.5% more likely to be sunny).

Each time the airport functions .land and .take_off are used the local weather is randomised.

Weather

.stormy? - returns random weather conditions in the form of a boolean, true being stormy, false being sunny.

.stormy_weather is  private method that sets the weather condition randomly.

Testing

Tests were written with Rspec (3.2.2).

To run the tests, clone the repo to a local folder and in terminal run:

$> cd airport
$> rspec
