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

To play around with my code follow these instructions:

* In your terminal in the directory you wish run

```
* git clone https://github.com/velvetsnowman/airport_challenge.git
* cd airport_challenge
```

```
* require './lib/airport.rb'
* heathrow = Airport.new
* easyJet = Plane.new
```
* You can instantiate Airport with an argument (ie. Airport.new(n)) if you would like to change the capacity of the airport from 3 (default) to n

```
* heathrow.land(easyJet)
* heathrow.takeoff(easyJet)
```
* If weather conditions are bad you will not be able to land or take off!
* For testing please run
```
* rspec
```
* Enjoy




## User Stories

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
