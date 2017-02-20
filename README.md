## Makers Weekend Challenge 1: Airport Challenge
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

Task
-----

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

## Approach

Using the above User Stories, I created a Domain Model, as below:
```
 Plane <-- status --> 'landed' / 'flying'
 Airport <-- land_plane(plane) --> return string
 Airport <-- take_off --> return string
 Airport <-- full? & empty? & stormy? --> raise error
 Airport <-- change_airport_capacity --> capacity = new_value
 Weather <-- stormy? --> true/false
```

## How to use

1) On your terminal, run the command ```gem install bundle```

2) Once the installation completes, run ```bundle```

3) On your terminal, run irb and below is an example of how to use the program

## Additional Requirements for future inclusion/Bottlenecks

- Better functionality and wider testing for plane status (landed/flying)
- Tidier testing for doubles
