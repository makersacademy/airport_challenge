Airport Challenge
=================

Instructions
---------

* challenge time: rest of the day (or the weekend if necessary)
* Feel free to use google, your notes, books, etc but work on your own
* If you have a partial solution, still check in a partial solution
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-------

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (start by forking this repo, then edit week 1)
* Fork this repo

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
I want to be able to prevent airplanes landing when the weather is stormy
```

Your task is to test drive the creation a set of classes/modules to satisfy all the above user stories. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed. 

The specs provided are merely for your guidance.  Please create more unit and/or feature tests as appropriate.  The existing code in this repository provided the layout of a set of pending unit tests, and a pending 'grand finale' feature test that combines a number of features. It is up to you to write the tests and create additional tests as necessary.

Read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs. There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

The tests are located in the spec directory. These tests are there just for the inspiration if you need it. You don’t have to implement every single test there and you aren’t limited by the tests there either. Feel free to modify the tests are you see fit.

Please create separate files for every class, module and test suite. 

The submission will be judged on the following criteria:

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first. 

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Video Overview
--------------

* [Friday Morning Video Overview](https://www.youtube.com/watch?v=6QVv8IxTaWM)

