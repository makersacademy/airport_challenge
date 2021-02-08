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
Hi! Welcome to my version of the Makers Airport Challenge. I have built a functioning program, using TDD and RSpec, that controls the flow of planes at airports - by emulating their landing and take off. These airports are affected by the weather and will not allow planes to land or take off if the weather is stormy.

Code examples and feature tests are at the end of the README if you're interested in those specifically.

## How far did I get? What did I learn? ##

I completed the whole challenge!! Well, sort of.. I coded the tests and functionality for one edge case, but stopped there. The Superbowl is on in a few minutes and it's Patrick Mahomes vs Tom Brady. I can't miss that!! If you have no idea what that means, think of it as the Buddha vs Jesus.. but obviously more aggressive. Basically two ridiculously awesome people. But that's besides the point. I probably prefer Lao Tzu anyway :).

The tests should all pass with 100% coverage, including the first edge case (planes trying to land while they're still grounded). It seemed like the best way to write the other edge cases would have probably been to work with the plane class and spec, and I did start but had to restart quite a few times - so I chose to conclude it here.

This challenge has really helped me push my synctatical knowledge and skills with RSpec, and I really enjoyed it as I went through it. It was quite frustrating at times, especially because the code itself isn't very difficult to write - I'm still getting confident and effective with the actual syntax and logic of RSpec but I'm coming to really love it. Cycling through Feature tests and Unit tests helped me build a relatively robust program and deepen my understanding. I really enjoy thinking about products and why they're successful, and am super eager to build products that are solid and useful for customers, so the TDD process really appeals to me and I can see why it's useful for building sustainable programs.

I also need to do further research and practice with private and public methods, but did my best with them today.

## Great! What was my process? ##
I broke the User Stories down into tables, and then made simple diagrams from them. This really helped me tackle everything one step at a time, and was my saving grace any time I got lost or wound up.

[User Story Representations](user_story_reps.pdf)

I followed the Red-Green-Refactor process. I created a feature test for the first feature, within the first user story. I used the information I received from this feature test to write my first unit test. I watched that fail, and wrote the code to make it pass. I watched it pass, then refactored everything. I checked that it was all still green, and then restarted the process for the next feature.

I made meaningful commits at the completion of each user story, as well as any other stages that I felt were important and could have needed to rewind to. I did, however, package the last two user stories into one commit as they were very similar, and required almost identical tests and code.

## Challenges // Blockers ##

As I mentioned, my most common and harrowing (*spooky ghost sound*) blockers were around writing my tests properly, specifically if I hadn't had much practice with a specific type of problem and the syntax relevant to it. For example, my first real blocker was writing a stub to check if a plane was at the airport. Luckily, I had been provided with a really useful link which quite clearly articulated the solution (or at least, it was clear once I actually paid attention!).

Even after that, I continued to hit roadblocks to do with writing tests with the correct syntax, but started to feel more and more comfortable and confident as I went along. I started paying more attention to how I can refactor my tests to be tidier and more readable using describe, context, and before blocks. This allowed me to create doubles according to specific types of tests, and segment them all together. This is much more efficient and readable than repeating doubles and stubs for multiple tests. It also made me feel pretty cool, I'll be honest *shrug*.

## Code ##
What you've been waiting for! Right?

I created three classes within this project - Airport, Plane, and Weather. Of course, there were three accompanying spec files for these. The airport class is currently the most robust and contains methods to instruct planes to land and take off; to prevent them from doing those two things (if the airport is full, weather is stormy, etc); to check if planes are still at the airport; check if the airport is full; and to manually override the default capacity for a specific airport.

The Plane class would probably grow as further edge cases are coded for, but does not currently contain anything besides the instatiation of itself.

The Weather class contains a method to randomly set the weather_state, and a stormy? method to check if the weather_state is stormy (10% chance). Weather_state selects a random number between 1 and 10, and stormy? == true if weather_state == 10. The stormy? method is called and utilised within the Airport class, to prevent planes from landing and taking off when the weather is unsuitable(stormy?).

All of the tests are currently spread out in proportion to the size of the classes, as this program was written test-first. This ensures that bugs are kept to a minimum, and that we're able to incrementally and effectively build the program to withstand a variety of different possibilities. I found feature tests very helpful in checking or finding any cases that I may have missed in my unit tests.

I used rubocop to check my code for correct formatting (what an awesome tool!), as well as simplecov to check my code's coverage (also a God-send!). Simplecov really helped get me back on track when my code started becoming overly-complicated or unsound.

## Feature Tests ##

(What you've really been waiting for)

Here are a couple of feature tests that demonstrate the current user experience, as well as the intended user experience:

[Basic Feature Test](docs/airport_challenge_basic_feature_test.png)

This feature test showcases all of the current features of the program. Some key features: error returned if user tries to land plane that is still grounded; the ability to check if the weather is stormy?; the ability to check an airport's capacity and manually set a new one; and the ability to see which planes are currently stored in the airport. The last feature also highlights how planes are stored and removed when they land and take off.

[Advanced Feature Test - 1](docs/airport_challenge_advanced_feature_test_1.png)
[Advanced Feature Test - 2](docs/airport_challenge_advanced_feature_test_2.png)

This feature test lands 10 planes at once and then attempts to take them off. The 10 planes are stored at the airport when they land, but are not removed from the airport once they take off. This is mostly because I haven't currently added a built in functionality to land multiple planes at once and then take them off. I tried to use an array to simulate what I would probably want to happen. I chose to showcase this feature test as I think it's a good example of where the program can go.

You can also see how the weather is being randomised constantly and will sometimes prevent planes from landing or taking off, until it sets back to stormy? == false.
