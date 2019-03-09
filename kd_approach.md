## Project Overview
## Processes & Approach

#### CLIENT REQUIREMENTS

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

#### USER STORIES

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

PROGRAM USAGE:

- For the first iteration of the product, this software will be usable in Interactive Ruby via the terminal using `irb`

#### STEP 1 - SKETCHING OUT THE DOMAIN MODEL

I translated the user stories into a domain model.

#### STEP 2 - SET OUT THE OBJECTS / CHARACTERISTICS / INTERACTIONS

From the user stories, I set out the objects I will model and their interactions (messages).

#### STEP 3 - DEFINE METHODS AND WHAT THEY DO

Now that I set out my domain model, objects and their interactions (messages), next, I set out the methods.

#### STEP 4 - DEFINE TEST CASES

Now that I set out my domain model, objects and their interactions (messages), next, I set out the test cases.

#### STEP 5 - TDD PROCCESS

With my notes, I will go through the TDD process.

- USER STORY
- FEATURE TEST
- UNIT TEST
- CODE IMPLEMENTATION
- FEATURE TEST

##### CLASSES/OBJECTS

- Airport
- Weather
- Plane

##### OBJECT CHARACTERISTCS

##### AIRPORT

Has a:

- Capacity
- List of planes
- Receives a weather status

Methods:

- `take_off`
- `land`

##### WEATHER

Has a:

- Weather status

Methods:

- `stormy?`
- `weather_status`

##### PLANE

Has a:

- Ability to receive message from airport to land

Methods:

- `land`


#### DOMAIN MODEL: MESSAGES/INTERACTIONS

Here is a screenshot of my domain model.


#### STORIES

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

##### OBJECTS

- Airport
- Plane

##### MESSAGES

- Airport sends message to plane to land
- Plane receives message to land from airport

##### TEST CASE(S)

1. [X] Airport object is instantiated? Y/N
2. [X] Plane object is instantiated? Y/N
3. [X] Airport has a `land` method 
4. [X] Airport sends message to plane to `land`; plane receives `land`
5. [X] Airport list of planes has plane

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
##### OBJECTS

- Airport
- Plane

##### MESSAGES

- Airport takes a plane from the list of planes at the airport and provides instruction for it to take off
- Airport checks that plane is no longer in the list of planes
- Airport provides a confirmation message that plane is no longer in airport list

##### TEST CASE(S)

1. [X] Airport has a `take_off` method 
2. [X] Airport sends message to a plane from list of planes to `take_off` (basic test of one plane)
3. [X] Checks that plane object is no longer in list of planes (basic test of one plane)
4. Test that message is given when plane no longer in airport list
5. [X] Airport cannot instruct plane to `take_off` in scenario that list of planes is empty because there are no planes

Advanced tests:

6. Airport sends message to any plane from list of planes to `take_off`
7. Checks that specific plane object is no longer at the airport

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

##### OBJECTS

- Airport
- Plane
- Weather

##### MESSAGES

- Weather object has the responsibility to decide whether it is sunny or stormy whenever it is instantiated

- Weather object (sunny or stormy) given to the airport for the status of the weather

- Weather object has random weather generator to decide on `sunny` or `stormy`

- Airport receives message from weather object

- Airport instructs plane in the plane list to 'take off', but this is prevented when weather is stormy

##### TEST CASE(S)

1. Weather object is instantiated? Y/N?
2. Weather object has a `stormy?` method
3. Weather object has a `weather_status` method
4. `weather_status` returns `"stormy" or "sunny"`
5. `stormy?` method returns `true` if `weather_status` is equal to `stormy`
6. `stormy?` method returns `false` if `weather_status` is equal to `sunny`
7. An error is raised when airport instructs plane in the plane list to `take_off` if weather `stormy?` is `true`

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

##### OBJECTS

- Airport
- Plane
- Weather

##### MESSAGES

- Weather object has the responsibility to decide whether it is sunny or stormy whenever it is instantiated

- Weather objects (sunny or stormy) are given to the airport for the status of the weather

- Airport receives message from weather object

- Airport sends a message to plane to 'land', but this is prevented when weather is stormy

##### TEST CASE(S)

1. An error is raised when airport instructs plane to `land` if weather `stormy?` is `true`

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```

##### OBJECTS

- Airport
- Plane

##### MESSAGES

- Airport has a set capacity
- Airport sends a message to a plane to land, but this is prevented because the capacity is full

##### TEST CASE(S)

1. An error is raised when airport instructs plane to `land` if capacity is reached

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
##### OBJECTS

- Airport

##### MESSAGES

- Airport has capacity which can be set when an airport object is instantiated

##### TEST CASE(S)

1. If capacity not given when airport is instantiated, use the default capacity
2. If capacity is given when airport is instantiated, use the capacity set
3. Check airport capacity can be changed on the same airport object


#### TEST CASE(S)

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

