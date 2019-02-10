# Airport challenge

The first weekend challenge from the Maker's Academy was to create an app for managing planes taking off and landing at an airport. 

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

## How to download and run

Run `git clone git@github.com:simon-norman/airport_challenge.git` to clone repo. 
Go into repo using `cd airport_challenge`.
Ensure version of ruby is installed and set using RVM that matches version in .ruby-version file
Run `bundle install` to install all dependencies.
Run `rspec` to run tests.
Rub `irb` to run program, requiring the airport, plane, and weather files to get access to their classes.


## Approach and technologies

Technologies used included Ruby, rspec (for testing), and Rubocop (for code quality).

I used the following incremental approach:

1. Examined the first requested feature (landing a plane) from the user stories

2. Created a domain model for that first feature to identify the classes and methods I would likely need

3. Wrote a failing feature test for that feature

4. From there, I selected the most appropriate class to start writing unit tests for, which in this case was Plane (as the user stories clearly stated the user would be instructing the plane to land)

5. Wrote a first failing test to land the plane, which tested that the land method would result in the plane calling land_plane on the airport class (which I mocked out for the plane unit tests), passing itself as an argument

6. Created the Plane class with a land method to make this first test 

7. Refactored my code and test code

8. Committed my changes to the repo

9. Identified the next test, using the instructions from the exercise as a guide for what key criteria(e.g. could not land plane that was already on the ground) it should fulfil, and repeated the Red -> Green -> Refactor process

10. Continued this until all key criteria were met and the feature test was passing

11. Examined the next requested feature, and updated my domain model, wrote a failing feature test etc.

By using this incremental approach, I kept my design simple. As I did not try to anticipate the code that would be needed for features I had not started yet, I not only avoided redundant code at each stage, but also found it easier to adapt my design when I then started those new features. Had I tried to anticipate later features, I would have only made questionable early design decisions that I would have later had to adapt or undo anyway, due to the challenge of forecasting a good future design. 

Moreover, by using TDD, it was straightforward to adapt the design, as the tests enabled me to quickly fix any breaking changes I made. 

I used Rubocop to help ensure good code quality, and made this process fast by using auto-highlight and auto-fix options in VS Code. Moreover, using the VS Code debugger also facilitated debugging. 
