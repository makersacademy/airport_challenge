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
Airport Challenge
=================
This document intends to explain how I approached the challenge trying to
resolve the following users' stories.

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
Approaching the challenge
----------------------
First of all, I have approached each story in isolation, I run a feature test for each user story using Irb, and I let the error guiding me when trying to write the unit test for that particular feature.
Once I had the Unit test written I would run rspec and follow the error messages.

The error messages from rspec would give me an indication of what kind of cod I needed to write and suddenly my classes and objects start to emerge.
Initially my approach was to have planes that would handle the landing and take off as it made sense in my head but I then changed my approach and built a class airport that would allow the landing and taking off of the planes.

I wrote my code and refactored couple of times to avoid repetition and making my documentation more clear by organising the unit test within context blocks.

in this challenge I learned how to stub the randomness created by the method .stormy?

Few things need to improve and I was also not able to implement the last user story.
