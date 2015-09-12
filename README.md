Airport Challenge
=================
Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc but work on your own
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning
* If you do not submit a pull request, we will not be able to see your progress

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_september2015 (start by forking this repo, then edit week 1 - you can edit directly on Github)
2. Fork this repo, and clone to your local machine
3. run the command `gem install bundle`
4. When the installation completes, run `bundle`
3. Complete the following task:

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

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.


##This is my description of the program.

We have 3 objects plane, airport, weather.
The Plane - initially is flying (our var which describes plane -  flying = true) . Plane also  may be flying, landing, taking off, on the ground. it’s important that plane should be in the sky in the first 3 conditions (our condition  flying = true), when the plane is on the ground (our condition flying = false). 
The Airport can be described by 2 vars landing and taking off (it’s main functions)  initially taking off = false (airport doesn’t have any plane, and landing = true (if the weather is good), or false (if the weather is bad)     
The Airport 1) should have capacity . The airport must reject to plane landing 2) if it’s capacity  is overweighted or 3) the weather is bad. The airport must deny to plane taking off if there isn’t any plane or the weather is bad.  
The weather may be sunny or may be stormy   
So we have two instructions for plane's landing  and for taking off.
One method weather which return to us weither the weather is stormy or sunny.





