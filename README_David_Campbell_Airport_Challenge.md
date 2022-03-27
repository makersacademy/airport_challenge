David Campbell - March '22 cohort
Makers Course WEEK 2 - AIRPORT CHALLENGE

- Create a small program to control flow of planes at an airport.
- Every plane has a status to say wether it is in the air or landed at the airport
- This program developed using TDD

# initialised local git repo
# original airport challenge repo forked in github then cloned from github to local repo

# ruby updated to 3.0.2
# gem bundler installed/updated
# checked rspec up-to-date

User story 1 - 3 covered
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport

    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    # To ensure safety 
    # I want to prevent landing when the airport is full 

-Objectives, turn user stories into objects & actions

object => airport(therefore destination) => plane(object)in air, action: tell plane to land, take off, cannot land when airport full...

object => plane => action: landed at airport

- rspec spec/airport_spec.rb to run tests from airport_challenge folder
calling Class defined in airport.rb file

README revised on third commit to make process taken clearer and concentrated on working with airport spec and airport object/class (deleted created plane class & spec file at this stage as over-complicating process)

# With each step I ran a feature test first in irb then an rspec unit test, making sure they failed first and read result of each failed test. I created wrapper examples in my airport_spec then created each definition in my Airport class accordingly, making sure each step was failing then passing and ensuring 100 % coverage

# then ran rubocop and tightened up code accordingly - no offences detected and added and commited after each method definition added passed unit tests

-4th commit before pull request - added airport_capacity to limit number of planes allowed to land in airport
- renamed and moved README file to root folder
- ran rubocop to refactor/tidy code layout(one offence not corrected yet - unused method argument - will correct next session)

- rspec unit tests 3 examples passing with 100% coverage