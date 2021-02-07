## My Solution to the Airport Challenge ##

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
Hi! Welcome to my version of the Makers Airport Challenge. I have built a functioning program using TDD and RSpec, that is able to emulate the landing and take off of planes at airports. These airports are affected by the weather and will not allow planes to land or take off if the weather is stormy.

There is a roughly 10% chance of the weather being stormy, but randomness is of course not as simple as that and we can get into that another time :). In this program, the weather is considered stormy if weather_state is equal to 10. It is considered sunny if weather_state == any other number.

Code examples and feature tests are at the end of the README if you would like to see those directly.

## How far did I get? What did I learn? ##

I completed the whole challenge!! Well, sort of.. I coded the tests and functionality for one edge case, but stopped there. The Superbowl is on in a few minutes and it's Patrick Mahomes vs Tom Brady. I can't miss that!! If you have no idea what that means, think of it as the Buddha vs Jesus.. but obviously more aggressive. Basically two ridiculously awesome people. But that's besides the point. I probably prefer Lao Tzu anyway :).

The tests should all pass with 100% coverage, including the first edge case (planes trying to land while they're still grounded). It seemed like the best way to write the other edge cases would have probably been to work with the plane class and spec, and I did start but had to restart quite a few times - so I chose to conclude it here.

This challenge has really helped me push my synctatical knowledge and skills with RSpec, and I really enjoyed it as I went through it. It was quite frustrating at times, especially because the code itself isn't very difficult to write - I'm still getting confident and effective with the actual syntax and logic of RSpec but I'm coming to really love it. Cycling through Feature tests and Unit tests helped me build a relatively robust program and deepen my understanding. I really enjoy thinking about products and why they're successful, and am super eager to build products that are solid and useful for customers, so the TDD process really appeals to me and I can see why it's useful for building sustainable programs.

I also need to do further research and practice with private and public methods, but did my best with them today.

## Great! What about the actual code itself? What was the process? ##
I broke the User Stories down into tables, and then made simple diagrams from them. This really helped me tackle everything a step at a time, and was my saving grace any time I got lost or wound up.

User Story Representations:
https://docs.google.com/document/d/1DBY8AGhNPGZyTBH7NbiWuWzSISpm6BZO-1r5H7JT70c/edit?usp=sharing

I followed the Red-Green-Refactor process. I first created a feature test for the first feature within the first user story. I used the information I received from this feature test to write my first unit test. I watched that fail, and wrote the code to make it pass. I watched it pass, then refactored everything. I checked that it was all still green, and then restarted the process for the next feature.

I made meaningful commits at the completion of each user story, as well as any other stages that I felt were important. I packaged the last two user stories into one commit as they were very similar and required almost identical tests and code.

## Challenges ##

As I mentioned, my most common (and most harrowing) blockers were around writing my tests properly if I hadn't had much practice with a specific problem. For example, my first real challenge was writing a stub to check if a plane was at the airport. Luckily, I was provided with a really useful link that quite clearly articulated it (once I actually paid attention).

Even after that, I continued to hit roadblocks to do with writing tests using the correct syntax, but started to feel more and more comfortable and confident. I started paying more attention to how I can refactor my tests to be tidier and more readable, using describe, context, and before blocks. This allowed me to create doubles once or twice, instead of repeating them for each test. It also made me feel pretty cool, I'll be honest *shrug*.

## Code // feature tests ##

I created three classes within this project - Airport, Plane, and Weather. Of course, there were three accompanying spec files for these. The airport class is currently the most robust and contains methods to instruct planes to land and take off; to prevent them from doing those two things (if the airport is full, weather is stormy, etc); to check if planes are still at the airport and if the airport is full; and to manually override the default capacity for a specific airport.

The Plane class would probably fill out as further edge cases are coded for, but does not currently contain anything besides the creation of itself.

The Weather class contains a method to randomly set the weather_state, and a stormy? method to check if the weather_state is stormy (10% chance). The stormy? method is called and utilised within the Airport class, to prevent planes from landing and taking off when the weather is unsuitable.

All of the tests are currently spread out in proportion to the size of the classes, as this program was written test-first. This ensured that bugs were kept to a minimum, and that I was able to incrementally and effectively build the program to withstand a variety of different possibilities. I found feature tests very helpful in checking any angles that I may have missed in my unit tests so that I could rewrite them.

I used rubocop to check my code for correct formatting (what an awesome tool!), as well as simplecov to check my code's coverage (also a God-send!). Simplecov really helped get me back on track when my code started becoming overly-complicated or unsound. Anyway, now for what you've been waiting for! Here are a couple feature tests (I've linked them as screenshots):
