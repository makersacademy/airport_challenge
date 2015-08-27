Airport Challenge
=================
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

My thought process and how I broke down the challenge
---------
1. I took 2 mins to compose myself so I won't struggle with the struggle.

2. Decided that I will follow the chronological order of the user story provided to break down the challenge.

3. I focused on the first user story and particularly the line "land (method) my plane (an object, somewhat secondary) at the airport (an object, somewhat primary)". And so, I focused on implementing this feature first. Because plane seems to be the secondary object, I figured that plane should be an argument in the method land. So I went into irb first, open both the airport and plane class, which worked because of the default setting and tried to land the plane. Of course this came out as en error and I went into RSpec to recognize the method land with 1 argument. I then proceeded to implement this code in the main ruby file. And as expected the RSpec test passes. I should commit at this stage, but I got too excited and forgot and just proceeded (I will take a mental note to make sure I remember next time).

  I would then go back to irb and find that although it recognizes the method, the value return is nil, which is not expected. I started to think "What value should be returned at this stage?". I broke this thought process down somemore and figured the airport should have a space for planes to land AND when the plane lands, it should occupy this space. So, the value return should show that there's a plane in the airport. This led me to create an RSpec test, that recognizes the airport should firstly have an initialized default capacity AND secondly, recognize that the plane is in the airport. I pretty much repeated the logical steps that I described in 3a) until I'm fully satisfied with the feature of the first user story.

4. This process is repeated in the second user story where FIRST, the airport recognizes the method take off and SECOND, ensures that the return value shows that the airport has one less plane!

5. I then worked on the third user story with a very similar thought process. FIRST, I tested on irb and saw that I could land as much planes as I wanted. Hence, I implemented the test on RSpec and implemented the code in my main ruby file.

6. For the final user story, I decided I wanted it to be "sunny" 60% of the time and "stormy" 40% of the time. So I first tested if my randomizing weather feature worked. Secondly, I got the feature to raise errors if they try to take off and fly under stormy weather.

7. I quickly learnt this was not the final part though as the planes needed to tell me whether they were "flying" or "landed". Because the default setting of the weather is "sunny", the default setting of planes should be "flying". I then implemented this feature accordingly.


Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed.

The existing tests in the spec folder, and base classes in the lib folder are provided merely as a general guide.  Please create more classes, unit and/or feature tests as appropriate.  The existing specs provide the layout of a set of pending unit tests. It is up to you to implement the tests and create additional tests as necessary.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

As mentioned above the existing tests are there just for the inspiration if you need it. You don’t have to implement every single test there and you aren’t limited by the tests there either. Feel free to modify the tests as you see fit.

Please create separate files for every class, module and test suite.

The submission will be judged on the following criteria:

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

BONUS
* Write an RSpec **feature** test that lands and takes off a number of planes...

Note that is a practice 'Tech Test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **You should pay attention to these - the results will be added to your pull request**.  Green is good.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am
