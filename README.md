[![Build Status](https://travis-ci.org/michaellennox/airport_challenge.svg?branch=master)](https://travis-ci.org/michaellennox/airport_challenge)

#Airport Challenge

This is my solution for the [airport challenge](https://github.com/makersacademy/airport_challenge) carried out at the end of my first week at Makers' Academy.

##How I worked

I aimed to complete this challenge in a test driven manner, using manual feature tests within irb and automated unit tests with rspec. I would convert each individual user story into a failing manual feature test and then work on each individual segment as a new failing unit test. I have aimed to [commit every test cycle](https://github.com/michaellennox/airport_challenge/commits/master) so you can so my process.

I have tried to encapsulate my code as much as possible throughout and the end user should only ever be interacting with an instance of the Airport class.

eg to land a plane, the end user would call land on the airport they are at, passing the plane they want to land as an argument `airport.land(plane)` and vice-versa for taking-off `airport.take_off(plane)`. They should never directly interact with either a plane or a weather instance.

##Contributors:

* Michael Lennox, [github](https://github.com/michaellennox) michael@michaellennox.me
