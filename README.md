Airport Challenge
=================
This was a test for the weekend from Makers Academy.
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
Objectives of exercise
----
Using Test-Driven-Development to create an Airport simulation. With Airplanes that can takeoff and land and an Airport that only has a certain capacity. There was also supposed to be random weather that can deny Airplanes from taking off and landing.

Technologies used
----
- Ruby
- Rspec
- Git

Set Up Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run rspec for running tests.



**TASK SUMMARY**
-----

- We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.


**APPROACH**
-------

The initial step is to have break down each user story into 1-2 tests. For example, instruct plane to land. that would require the planes on the ground to have that plane landed.

So to pass this test, and the other tests. I drew up a 'relationship' diagram, where there are 2 classes, Airport and Plane, with the method being land, takeoff etc. Then i defined attribute of airport class, stormy, which sets condition whether can takeoff/land. Same with validation of full?, which sets before action requirement for land.

1.
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
Tests(plane):
plane class
Tests(airport):
plane lands in airport array

2.
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Tests(airport, take off)
plane takes off and results in an empty airport array

3.
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
Tests(airport)
Returns true or false stormy condition if a method is called
raises an error when plane tries to takeoff  when stormy

4.
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
Tests(airport)
Raises an error when planes tries to land when stormy.

5.
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
Tests(airport)
Set the airport full by landing planes up to capacity and landing another plane would raise an error.

6.
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Tests(airport)

Airport can set capacity and planes can land up to that capacity
If capacity not set, it defaults to a set default capacity

The last point is quite confusing, as I was thinking about changing default capacity, rather than changing capacity. Initially, I set the default capacity as variable in the test and code, however, later I changed default capacity to a constant, and capacity to variable. This way, the airport controller can set default capacity if needed.



***Extras***

**stub**

To do the stub took quite a while(2- 3hours), as I experimented using a Double of airport, but it wouldn't respond to other methods in Airport class. So I used stub to set

**edge cases**

Then, to pass the extra validation tests:

- Plane cannot takeoff if already flying,
raise error if these conditions are present.
Test: if plane is currently flying, it would raise error message when trying to takeoff.

Code: I defined attribute and method flying in plane class, which would return true if flying and false if not. I made test to  The code to pass the test would be incorporated into the takeoff and land methods.


- Cannot land if already landed.

Test: if plane has already landed, it would raise error when trying to land.


**Things I didn't do:**

Ensuring that planes can only take off from airports they are in.

- i plan to test using 2 airports, and set a scenario where one plan leaves a wrong airport and raises an error. To pass this test I think i might be able to assign 2 airports or assign airport attribute on plane class (e.g. @airport = 1) and use a conditional statement in land. I would test both of these approaches to see which one would work/work better.

- Use a mock for plane



**Maker's extra notes & guidance**
-------
**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes








