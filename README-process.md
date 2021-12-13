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


Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.


Interpreting User Stories
--------------------------

__________________________________________________________________
| air traffic controller  | instruct planes, ensure safety        |
| passengers              | get to destination                    |
| planes                  | land, takeoff                         |
| airport                 | allow/prevent landing/takeoff         |
__________________________________________________________________|

air traffic controller
- ensure safety
        - prevent landing when airport full
        - prevent landing when weather is stormy
        - prevent takeoff when weather is stormy


- to get passengers to destination
        - instruct plane to land at an airport
        - instruct plane to takeoff
                - and confirm no longer at airport


software used for different airports
- default airport capacity
        - can override as appropriate


weather = random number generator - sunny/stormy
use stub to override random weather

EDGE CASES :
- planes can only take off from airports they are in
- planes already flying cannot take off/ be in an airport
- planes landed cannot land again & must be in an airport



Setting Up
-----------

Create lib and spec directories with associated files


Work Plan
----------
The airport allows the planes to land
The airport allows the planes to takeoff
        The planes will confirm they are no longer at the airport after takeoff

        These user stories will need to define land and takeoff methods.

The airport prevents landing when the weather is stormy
The airport prevents takeoff when the weather is stormy

        These user stories will need to use a random number generator to determine if the weather is sunny or stormy

The airport prevents landing when the airport is full
The software will be used for different airports
        Default airport capacity set
        This can be overridden as appropriate

        These user stories will need to set a DEFAULT_CAPACITY

EDGE cases
Planes can only take off from airports they are in
Planes already flying cannot take off/be in an airport
Planes landed cannot land again and must be in an airport

        Edge cases will need to keep track of instances of different planes to see which state (landed or taking off) they are in.