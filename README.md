# Airport Challenge

[![Build Status](https://travis-ci.com/charlierdm/airport_challenge.svg?branch=master)](https://travis-ci.com/charlierdm/airport_challenge)


![alt text](https://m.dw.com/image/43469144_401.jpg "Airplane Challenge")



## Task


We have a request from a client to write the software to control the flow of
planes at an airport.  
The planes can land and take off provided that the weather is sunny.  
Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user  
stories that we worked out in collaboration with the client:



```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is
no longer in the airport

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

```
*** All user requirements have been met and the program runs as specified.

Almost all RSpec tests are within the airport_spec.rb file as I felt that the

airport is the control center in a real life context and it would be nice

to keep it true to life for this task ***
```


## Getting Started

```
Enter the following into your terminal to get going:

git clone https://github.com/charlierdm/airport_challenge.git
gem install bundle
bundle
```
## How to operate

![alt text](https://pbs.twimg.com/media/BubQVOvIMAALtIj.jpg "Airport control")

Create your own airplanes and enter the skies if weather permits directly from your  
command line (there's a 14.28% chance of a storm).

- To create an airport: **airport = Airplane.new**
- To change hanger capacity = **airport.capacity(enter number here)**
- To create a plane: **plane = Plane.new**
- To land in the airport = **airport.land(plane)**
- To take off = **plane.take_off**
- To view your hanger = **airport.hanger**
