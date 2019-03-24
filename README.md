# Airport challenge

In this friday challenge we are going to code a program with the following stories.
>As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

>As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

>As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

>As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

>As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

>As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Reading the stories we think we will need the following objects and messages.

1. [Plane](#plane)
  * [land](#land)
  * [take_off](#take_off)
2. [Airport](#airport)
  * [full?](#full?)
  * [landed](#landed)
  * [departed](#departed)
3. [Weather](#weather)
  * [stormy?](#stormy?)

## Plane

The plane is going to have two different states, landed or flying. To set this state we are going to have a variable with the airport is landed in or is going to be "FLYING_STATUS" if it is flying.

#### `land`
When the plane is flying, the given airport is not full and the weather is not stormy we land the plane, setting the airport to the given one and adding the plane to the airport with `landed`.

#### `take_off`
When we are in the given airport and the weather is not stormy we will take off, setting the airport to "FLYING_STATUS" and removing the plane from the airport using the `departed` method.

## Airport

We need the airport to have a capacity which can be set as appropriate, to do this we set a DEFAULT_CAPACITY to be set when initialised, but it can also be set in that moment.
To be able to set it at any appropriate moment we make an accessor.

We will need as well a place to store the planes that the airport have. this will be @planes.

#### `full?`
We need a method to check if this capacity have been reached for the landing plane process. We compare the capacity with the size of our @planes variable.

#### `landed`
We store the given plane in the list of planes.

#### `departed`
We remove the given plane from the list of planes.

## Weather
Whenever we have to land or take off we will have to check if it stormy.

#### `stormy?`

Is going to be a class method checked at the moment of the plane trying to take off or land.
We use rand(100) to get a random number between 0 and 99 and only saying it is stormy if it is in the last 5 (5% of being stormy)
