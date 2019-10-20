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

Steps completed:
-------

1. Forked this repo, and cloned it to my local machine
2. Ran the command `gem install bundle`
3. ran `bundle`, when the installation completed
4. Completed the following task:

Task completed
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

1. Test driven the set of classes/modules to satisfy all the above user stories.
  - used a random number generator, in creating and setting the weather (normally sunny but on rare occasions it may be stormy).
  - used a stub to override random weather to ensure consistent test behaviour.

2. My code defends against the following [edge cases]:
 - inconsistent states of the system, ensuring that planes can only take off from airports they are in
 - planes that are already flying cannot take off and be in an airport;
 - planes that are already flying cannot take off or be in an airport
 - planes that are landed cannot land again
 - planes that are landed must be in an airport

3. Separate files were created for every class, module and test suite.

4. (Bonus attempted and completed) RSpec **feature** test written that lands and takes off a number of planes

Headsup for code review:
-----------------------

* All tests are passing
* [Test coverage] SimpleCov: (98%)

Monday morning:
--------------
1. **Pull request submitted**


Tools used:
--------------
1. **rspec**
2. **rubocop**
3. **SimpleCov**

**References Used:**

* Sam Morgan: https://www.youtube.com/watch?v=Vg0cFVLH_EM
