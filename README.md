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


## Client Request
The client is an air traffic controller in a busy airport with planes taking off and landing they require software which can keep track of this activity. Planes can only take off or land if the weather permits it. Stormy weather will result in grounded flights and delayed arrivals.

## How to Use
Create new airports with Airport.new

2.6.3 :001 > heathrow = Airport.new(133)
 => #<Airport:0x00007f8359919400 @planes=[], @weather="clear", @capacity=133> 

Create new planes with Plane.new

2.6.3 :002 > batwing = Plane.new
 => #<Plane:0x00007f8359928360 @location="in transit"> 

Land planes with land(plane)

2.6.3 :003 > heathrow.land(batwing)
 => #<Plane:0x00007f8359928360 @location=#<Airport:0x00007f8359919400 @planes=[#<Plane:0x00007f8359928360 ...>], @weather="clear", @capacity=133>> 

Take off planes with take_off(plane)

2.6.3 :004 > heathrow.take_off(batwing)
 => #<Plane:0x00007f8359928360 @location="in transit"> 

## Methodology

I took these user stories one by one and used the BDD model to start to build my application.
I started with feature tests then created unit tests and built the programme from the solutions to these tests. Later on I performed extensive refactoring which forced me to adjust a number of my tests.

```As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

```
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
##Review
I feel like I have learnt a lot about test doubles and stubs although it is something I will need to work on more in the future.