Airport Challenge
=================

<<<<<<< HEAD
Original Task
=======
Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc but work on your own
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning
* If you do not submit a pull request, we will not be able to see your progress

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_july2015 (start by forking this repo, then edit week 1 - you can edit directly on Github)
2. Fork this repo, and clone to your local machine
3. run the command `gem install bundle`
4. When the installation completes, run `bundle`
3. Complete the following task:

Task
>>>>>>> master
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

<<<<<<< HEAD
Approach
-----
=======
Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed. 

The existing tests in the spec folder, and base classes in the lib folder are provided merely as a general guide.  Please create more classes, unit and/or feature tests as appropriate.  The existing specs provide the layout of a set of pending unit tests. It is up to you to implement the tests and create additional tests as necessary.
>>>>>>> master

Developed an airport centric system where two primary method interfaces (land and release) control the movement of planes. This is because the tasks across all stakeholder use cases involved a key action from the airport destination.
IRB has been assumed as the user interface for pilots and air traffic controllers.

Plane objects are tracked through their 'flying' status which is toggled between true and false by the airport's land and release methods.

Weather volatility is introduced through the random weather change method which uses a random number generator (rand(2)) to control the 'stormy' attribute in the airport.

The testing suite has adopted one core feature test utilising stubs to check weather 6 planes are able to land and take off during non-stormy condtions.
Unit testing on the airport then adds the context of stormy conditions which raise errors when trying to land or take-off.
Plane unit tests ensure that the flying attribute changes correctly before and after take-off.

<<<<<<< HEAD
=======
* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.
 
BONUS
* Write an RSpec **feature** test that lands and takes off a number of planes...
>>>>>>> master

Outstanding Issues
-----

* Despite installing rubocop and editing sublime style settings still registering a large number of basic Hound style violations e.g. trialling white-space, tabs etc

<<<<<<< HEAD
=======
* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **You should pay attention to these - the results will be added to your pull request**.  Green is good.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am
>>>>>>> master
