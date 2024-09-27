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

To Run
------

To run the program, open in irb or pry.
To run the tests, use rspec.

What The Program Is
--------------------
This program is a basic version of an airport. It handles the behaviour of planes landing, taking off and being stored in an airport and how these features interact with other variables like airport capacity and weather conditions.

Task
-----
The following statements had to be converted into nouns and verbs and transformed into a program.

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

The Features
------------
The problems specified in the assignnment involved six steps.
1) Allow planes to land
2) All planes to take off 
3) Prevent landing when the airport is full
4) To hold a default capacity (such as 20 planes) which can be changed as appropriate.
5) To prevent takeoff in stormy weather
6) To prevent landing in stormy weather

What did you learn?
-------------------
On this project I learnt that there are often several dimensions to writing a method that aren't always immediately apparent - but unfold as you write the program and consider the logical consequences of how your program is designed. For example, say we start with an airport with one plane stationed in it and call the take_off method: once the plane has taken off it should no longer be in the airport - so you might need to create an array to store the planes and know how to remove the plane from the array when the take_off method is called (unless the take_off is interupted by a separate concern such as the weather).

More generallu, I learnt that it helps to understand what each method is trying to accomplish by writing the test first - and then designing each feature of the program to pass an individual test as you go along. This helps to identify each problem as it crops up (as opposed to writing the whole program first which will often contain multiple errors - which make it harder to identify and fix). If you can't identify the problem and which method it relates to, it's possible that apart from wasting time and getting stressed - you might even tamper with perfectly acceptable code and produce more errors that you can't identify! In short, I've learnt that Test-Driven Development is the best approach because you receive more errors that you expect - that are easier to pinpoint - and easier to google solutions to (because you can ask more specific questions focussed on managable problems). This also stops you feeling overwhelmed by the problem at hand and makes the process more formulaic and enjoyable!
 
What makes your project stand out? 
----------------------------------
It's possible that my Airport class contains all the methods - as opposed spreading the methods between the Airport and the Plane class. I also didn't create a separate Weather class (but simply built the weather into the Airport Class). It's possible this wasn't the most logical way to arrange methods (after all, its not the airport that generate the local weather - instead the weather convenes on the airport). However, I thought that it made enough sense considering that an airport's location will in many cases determine its weather (Athens airport is going to be sunny more frequently than Heathrow), and for each new airport object - it is unique (much like the weather of different airports around the world).

The main reason for this decision was that it made it simpler to keep track of the spec tests (by keeping them in one file - airport_spec.rb) and - crucially - meant I didn't have to do the mental acrobatics of getting several classes with their own methods to interact and play nicely. 

Steps
-----
Essentially, I built one method at a time. I often started by leaving the method empty or running a mock test - a test where I knew the answer would be true - such as checking the weather would be sunny - but reducing the array to contain one element - :sunny, or writing a test where I knew what the error would be. First, I would run the program in irb - instantiate an instance of the necessary classes - and run the tests until the expected errors were thrown. Then I would write the spec tests (to test for some code that I hadn't written yet). Finally, I would build the method and repeat this process until the method worked and I could move onto the next one. 