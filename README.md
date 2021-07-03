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

Intro
------

This was my first solo weekend challenge while at Makers, a 12-week intensive software engineering bootcamp. We were given the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

My approach
------------

### Step 1: finding the nouns in the User Stories

As an **air traffic controller** 
So I can get **passengers** to a **destination** 
I want to instruct a **plane** to land at an **airport**

As an **air traffic controller** 
So I can get **passengers** on the way to their **destination** 
I want to instruct a **plane** to take off from an **airport** and confirm that it is no longer in the airport

As an **air traffic controller**
To ensure safety 
I want to prevent landing when the **airport** is full 

As the **system designer**
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an **air traffic controller** 
To ensure safety 
I want to prevent takeoff when **weather** is stormy 

As an **air traffic controller** 
To ensure safety 
I want to prevent landing when **weather** is stormy

### Step 2: finding the verbs in the User Stories

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to **land** at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to **take off** from an airport and **confirm that it is no longer in the airport**

As an air traffic controller 
To ensure safety 
I want to **prevent landing** when the airport **is full** 

As the system designer
So that the software can be used for many different airports
I would like a **default airport capacity** that can be **overridden** as appropriate

As an air traffic controller 
To ensure safety 
I want to **prevent takeoff** when weather **is stormy** 

As an air traffic controller 
To ensure safety 
I want to **prevent landing** when weather **is stormy**

### Step 3: organising the nouns and verbs into Objects and Messages

Objects  | Messages
------------- | -------------
Air traffic controller | 
Passengers  | 
Destination |
Plane | land, take-off, at_airport?
Airport | full?
System designer | 
Weather | is_stormy?

### Step 4: diagramming how our Objects will use Messages to communicate with one another

```
Plane <-- land  --> Airport
Plane <-- take-off  --> Airport
Plane <-- at_airport? --> Airport
Airport <-- full? --> Plane
Weather <-- is_stormy? --> Plane
```

### Step 5: testing
For each stage, I ran a feature test in irb.
I then wrote a failing unit test in the relevant rspec file.
Next I made the changes required to pass the test.
And finially I refactored.
After covering everything from the domain model, I repeated this pattern for the edge cases.
