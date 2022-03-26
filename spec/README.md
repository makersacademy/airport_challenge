David Campbell - March '22 cohort
Makers Course WEEK 2 - Airport Challenge

- Create a small program to control flow of planes at an airport.
- Every plane has a status to say wether it is in the air or landed at the airport
- This program developed using TDD

# initialised local git repo
# original airport challenge repo forked in github then cloned from github to local repo

# ruby updated to 3.0.2
# gem bundler installed/updated
# checked rspec up-to-date

user story 1
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport

-1st objective, turn user story into objects & actions

object => airport(therefore destination) => plane(object)in air, action: tell plane to land

object => plane => action: landed at airport

- rspec spec/airport_spec.rb to run tests from airport_challenge folder 

# 1st ran feature tests in irb

# created airport and plane objects and...
# ran a land_plane method on the airport calling the plane object
- all gave uninitialized constant errors

# created an airport_spec.rb file in spec folder with a an empty spec with a class description - uninitialized constant fail but has 100 % coverage

# created an airport.rb file and added an Airport class
# added a require to airport.rb file in the spec file -ran rspec with no fails & 100 % coverage

# ran a feature test from irb, require'd airport.rb file and could initialize an airport object but not a plane object - return to next unit test

# ran rubocop and tightened up code accordingly

- 1st add, commit & push