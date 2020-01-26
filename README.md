# Airport-challenge

This programme controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

I created this application for my first weekend challenge at [Makers Academy](https://github.com/makersacademy).


## Instructions

#### Install: ####

1. Fork this repo, and clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

#### Run: ####

```Shell
$ irb
> require './lib/airport.rb'
```

#### Create an airport: ####

You can create an airport with a default capacity of 10, or specify your own capacity:

```Shell
> airport = Airport.new # => @capacity = 10
> big_airport = Airport.new(20) # => @capacity = 20
```

#### Add and instruct planes: ####

By default, new planes are not in your airport, so you will need to 'land' them before you can instruct them to take-off:

```Shell
> plane1 = Plane.new
> plane2 = Plane.new
> airport.land(plane1) # => :grounded
> airport.take_off(plane1) # => :airborne
> airport.land(plane2) # => :grounded
```

#### Wait out the storm ####

You might encounter problems landing and taking off if weather is stormy - but this is rare and you should be able to take-off/land soon enough!

## User requirements

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

## How I built it

#### Interpreting requirements

To create the airport programme, I broke down the above user stories into one line requirements and imagined how a user might ask each requirement of the programme. I then designed feature tests and unit tests for each requirement, to drive the design of my code in application.

1. Instruct a plane to land at an airport

    ```Ruby
    plane.land
    ```
2. Instruct a plane to take off from an airport, and confirm that it is no longer in the airport

    ```Ruby
    plane.take_off
    ```

3. Prevent a plane from landing if an airport is full
    - Airport requires a capacity
    - Send a message to plane to prevent landing

    ```Ruby
    airport.full?
    ```

4. Allow a user to specify a capacity for an airport upon creation
    Both of the following should work:

    ```Ruby
    Airport.new(30) 
    Airport.new
    ```
5. Raise error when running `airport.take_off(plane)` if weather is stormy.

    ```Ruby
    fail "Too stormy for take-off" if weather.stormy?
    ```

    - requires a new weather object

#### Designing Objects ####

As I worked through the user stories, I created a table of each object; its attributes and its behaviour (methods):

1.

| Object: | Airport | | | |
| ------- | ------- | - | - | - |
| **Attributes:** | Planes | Capacity | Weather | |
| **Methods:** | Land | Take off |Full? | In airport? |


2. 

| Object: | Plane | | | |
| ------- | ----- | - | - | - |
| **Attributes:** | Location |
| **Methods:** | Land | Take off | Grounded? | Flying? |

3. 

| Object: | Weather | |
| ------- | ----- | - |
| **Attributes:** | Sunny | Stormy |
| **Methods:** | Stormy? |




#### Testing for edge cases ####

Once initial user stories were satisfied, I tested and adapted my code for the following edge cases:

1. Planes can only take off from airports they are in
2. Planes that are already flying cannot take off
3. Planes that are flying cannot be in an airport
4. Planes that are landed cannot land again
5. Planes that are landed must be in an airport
