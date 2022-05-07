Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____NB____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

# Airport Challenge

This Airport challenge allows users to instruct a plane to land and take off from an airport, but only if the weather is sunny! We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## The task

My task was to test drive the creation of a set of classes/modules to satisfy all the above user stories. I needed to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, I needed need to use a stub to override random weather to ensure consistent test behaviour.

My code needed to defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

## Getting started

`git clone https://github.com/NBenzineb/airport_challenge.git`

## Usage

`irb -r ./lib/plane.rb'`
- You can create plane instances (plane = Plane.new) and airport instances (airport = Airport.new).
- To instruct a plane to take off from an airport you can use the 'takeoff' method (airport.takeoff(plane))
- To instruct a plane to land you can use the 'land' method (airport.land(plane))
### Some things to note
- The airport's default capacity is set to 10 planes, so if you would like to change the airports default capacity, you can pass your desired capacity as an integer to the airport instance eg (airport = Airport.new(20))
- You will only be able to land and take-off planes if the weather is sunny. Luckily, the weather is sunny 75% of the time, and stormy the other 25%. 



## Running tests

`rspec`



## My approach to solving the problem

Here are the user stories that worked out in collaboration with the imaginary client.

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

### Step 1: Functional representation of user stories

To get me started, I identified all the nouns and verbs in the user stories.

I then considered for each user story which of those nouns and verbs relate to the end users of the software and what they need to be able to do with it, and which were about how the software itself needs to function, i.e. pertaining to the **functional representation** of the user stories in terms of **objects** in the program.

I mapped out functional representation of each story in terms of _objects_, _messages_, _parameters_, _behaviour_, and where more relevant, _objects_, _constants_, and _instance variables_.

Here's a consolidated mapping for an overall picture of the structure of of the program as a whole, as follows:

**Objects and messages**

| Objects     | Messages        | Parameters   | Behaviour                    |
| ------------| ----------------| -------------| -----------------------------|
| Weather     | Stormy?         |              | Reports whether stormy       |
| Airport     | Full?           |              | Reports whether full         |
| Airport     | Change capacity |              | Changes capacity             |
| Plane       | Land            | Airport      | Lands at airport             |
|             |                 |              | Prevents landing if stormy   |
|             | Take off        | Airport      | Take off from airport        |
|             |                 |              | Prevents take-off if stormy  |
|             | Report          |              | Report location              |

**Objects and states**

| Objects     | Constants          | Instance variables   | 
| ------------| -------------------| ---------------------| 
| Weather     | Weather types      | Stormy               |
| Airport     | Default capacity   | Capacity             |
|             |                    | Hangar               |
| Plane       |                    | Location             |
