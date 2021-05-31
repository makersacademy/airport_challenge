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

Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
User story 1
-------------
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

User story 2
-------------
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

User story 3
-------------
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

User story 4
-------------
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

User story 5
-------------
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

User story 6
-------------
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

```
NB: additional unit tests have been used to extend class functionality. For example, making use of @flying in the Plane class allows our client to consistently and correctly report plane status and location across various airports.
 
