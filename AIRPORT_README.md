# Airport Challenge

AIRPORT_README briefly explains my approach to solving the challenge. Link to the task source with detailed instructions regarding the challenge itself is available [here](https://github.com/makersacademy/airport_challenge).

Unfinished code or other elements will be highlighted, and plan will be provided how to finalise the challenge in [ToDo](#todo).

## Getting Started

These instructions will help to follow the steps of the project.

### Prerequisites & Installing

Things you need to install if you want to edit the repository include the following:

- Fork this repo, and clone to your local machine.
- Run the command gem install bundle (if you don't have bundle already).
- When the installation completes, run bundle.

## Running the tests

Run the automated tests for this challenge via RSpec or rubocop.

### Break down of end to end tests

In the initial stages of the challenge feature tests were run using IRB.

- Feature test example:

![FT](https://github.com/VytisVA/airport_challenge/blob/master/FT%20IRB.png)

- Unit test image:

![UT](https://github.com/VytisVA/airport_challenge/blob/master/UT%20RSpec.png)

- Unit testing/Manual feature testing via IRB for let_landing method:

![UT2](https://github.com/VytisVA/airport_challenge/blob/master/FT2%20IRB.png)

- Failure in the unit test - let_landing method:

![UT2](https://github.com/VytisVA/airport_challenge/blob/master/UT2%20RSpec.png)

## Built With  

* [Visual Studio Code](https://code.visualstudio.com/)
* [Atom](https://atom.io/)
* [Sublime Text](https://www.sublimetext.com/)
* [iterm2](https://www.iterm2.com/)

## Authors

* [Vytis Vadoklis aka VytisVA](https://github.com/VytisVA)

## Steps Completed

- 1 - Setting up a project:
    - Installed Visual Studio Code.
    - Written AIRPORT_README.md.
    - Created lib directory.
    - Making first commit to github.
- 2 - User Stories to a Domain Model:
    - Created Domain Model file with initial objects and messages canvas.
- 3 - Feature Tests to Unit Tests:
    - Writing first test.
    - Created airport_spec.rb, described Airport class within.
    - Ran RSpec and received the first failure.
- 4 - Passing first Unit Test:
    - Created lib/airport.rb with the class defined within.
    - Ran RSpec and received fist test pass.
- 5 - Feature Tests in IRB and further unit tests:
    - Running feature test.
    - Running unit test to get failure.
    - Running unit test after defining let_takeoff method in airport.rb.
    - Included IRB test image for the AIRPORT_README.
    - Included failing unit test image.
- 6 - Launching Planes, checking plane status:
    - Running feature tests plane.status_grounded? and getting NoMethodError.
    - Creating spec/plane_spec.rb and spec/plane.rb files.
    - Writing test for plane_spec.rb, running file and getting the Errors
    - Writing code for plane.rb which includes class Plane, and passing tests.
- 7 - Further feature and unit testing - Objects focus:
    - airport.rb Plane object created, and plane.rb method updated.
    - Domain model updated.
- 8 - Including instance variables in the code:
    - Manual feature testing via IRB for let_landing method - getting error.
    - Repeating the failure in the unit test - let_landing method.
    - Adding unit test with let_landing, updating airport.rb.
    - Creating attr_reader :plane.
- 9 -      


## ToDo

- Step to do
- Step to do
- Step TBC    
