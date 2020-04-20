# Airport Challenge - will-head

```
        ______
        _\____\___
=  = ==(____WH____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Objects

* Air Traffic Controller (Atc)
* Plane
* Airport
* System Designer (Sd)
* Weather
* Air
* World

## Actions

* Atc gets Passengers to Destination
* Atc gets Passenters on way to Destination
* Atc instructs Plane to land at Airport
* Atc instructs Plane to takeoff at Airport
* Atc confims Plane not in airport at Airport
* Atc prevents landing when Airport is full to ensure Safety
* Sd overrides default Airport capacity for different Airports
* Atc prevents takeoff when Weather is stormy to ensure Safety
* Atc prevents landing when Weather is stormy to ensure Safety

## Assumptions

* There can only be one Atc
* There can only be one Sd
* There can only be one Air
* There can be multiple Planes
* There can be multiple Airports
* There is a World that owns the Air
* Planes and Airports can be put into the World
* Planes can either be in the Air, or in an Airport
* Atc decides where the planes go
* Atc can ask Planes to land at an Airport and will receive a message confirming if this was successful or not
* Atc can ask Planes to takeoff from an Airport and will recieve a message confirming if this was successful or not
* Atc can ask an Airport if a Plane is there
* Atc can ask the Air if a Plane is there
* Planes go into the Air when they are added to the World (for simplicity) 
* There can be more than one Plane at an Airport
* Airports have a maximum capacity of Planes
* Planes can't land if the Airport is at capacity
* Airports can't go over capacity
* Airport capacity must be a positive integer
* There can only be one Weather at an Airport
* The Weather is stormy 1 time out of 10
* Planes can't land at an Airport if the Weather is stormy
* Planes can't takeoff from an Airport if the Weather is stormy
* The Sd can increase or decrease the capacity of an Airport, provided it remains a positive integer

## Model

* The Atc can always ask where a Plane is.
* The World contains the Air.
* Planes and Airports are created outside, then added to the World.
* Only Planes and Airports can be added to the World.
* Planes added to the World will be added to the Air (since the World doesn't have any Airports until they are added).
* The Air will confirm with true if a Plane was successfully added.
* The Air will confirm with true if a Plane was successfully deleted.
* The World can ask the Air if it contains a Plane, otherwise it is assumed it's in an Airport.
* Airports know if they are empty or full.
* Airports will confirm with true if a Plane was successfully added.
* Airports will confirm with true if a Plane was successfully deleted.
* Airports can only be deleted if they are empty.
* Airports know if they have a Plane.
* Airports can't delete Planes they don't have.
* Planes are simple objects.
* Planes can only be deleted if they are in the Air.
* Airports have a default capacity.
* The Sd can overide the default Airport capacity.
* Each Airport has its own Weather.
* The World will return its current state if aksed.
* The World will only let a Plane land if the Airport has capacity.
* The World won't let a Plane land if the Airport says the Weather is stormy.
* The World won't let a Plane takeoff if the Airport says the Weather is stormy.

## Object-Messages Table

| ```Status```                  | ```Object```     | ```Message``` |
|:--:                           |               --:|:--            |
| :white_check_mark:            | ```Atc```        | ```new``` |
| :white_check_mark:            | ```Atc```        | ```where_is(plane])``` |
| :white_check_mark:            | ```World```      | ```new``` |
| :white_check_mark:            | ```World```      | ```view``` |
| :white_check_mark:            | ```World```      | ```add(object)``` |
| :white_check_mark:            | ```World```      | ```del(object)``` |
| :white_check_mark:            | ```World```      | ```where_is(object)``` |
| :white_check_mark:            | ```World```      | ```land(plane, airport)``` |
| :white_check_mark:            | ```World```      | ```takeoff(plane, airport)``` |
| :white_check_mark:            | ```Air```        | ```new``` |
| :white_check_mark:            | ```Air```        | ```add(plane)``` |
| :white_check_mark:            | ```Air```        | ```del(plane)``` |
| :white_check_mark:            | ```Airport```    | ```new``` |
| :white_check_mark:            | ```Airport```    | ```empty?``` |
| :white_check_mark:            | ```Airport```    | ```full?``` |
| :white_check_mark:            | ```Airport```    | ```in?(plane)``` |
| :white_check_mark:            | ```Airport```    | ```capacity=(capacity)``` |
| :white_check_mark:            | ```Airport```    | ```weather``` |
| :white_check_mark:            | ```Airport```    | ```add(plane)``` |
| :white_check_mark:            | ```Airport```    | ```del(plane)``` |
| :white_check_mark:            | ```Weather```    | ```new``` |
| :white_check_mark:            | ```Weather```    | ```stormy?``` |
| :white_check_mark:            | ```Plane```      | ```new``` |
| :white_check_mark:            | ```Sd```         | ```new``` |
| :white_check_mark:            | ```Sd```         | ```capacity(airport, capacity)``` |

## Feature Tests

To test all User Stories run script:
./tdd.feature-test

Script will pause after each story, press Control-C to continue.

To feature test an individual object run:
./tdd.feature-test object-name

## Unit Tests

To test all Unit Tests and run rubocop, run script:
./tdd.test

To unit test an individual object run:
./tdd.test object-name

## Improvements

* Fix all tests commented with TODO:
* Make add/del methods private
* Put Atc inside World
* Give Airports and Planes names
* Make world.view more friendly, for example:
    There are 5 planes in the Air: A1, A2, A3, A4, A5
    There are 3 Airports: Heathrow, Stansted and Gatwick
    Heathrow has 2 Planes: A6, A7
    Stansted has 0 Planes:
    Gatwick has 1 Plane: A8
  
