Detailing my steps
--------------------

#### Step 1:
- Chose to start with testing for an airport class and then setting it's state in terms of capacity
  - Decided to amend the domain model structure shown to us during the week slightly to include a third 'state' column in the table

#### Step 2:
- Decided to define a plane class and test that it responds to all the methods/messages defined in the domain model

#### Step 3:
- Next step seemed to be to create some memory between the methods so that planes can be stored at different airports
  - Have some concern at this stage that the airport and plane classes are too entangled - but decided to proceed for now and then maybe revisit in refactoring stage

#### Step 4:
- Next decided to move onto the user story that prevents a plane from landing if the airport is full. I'm now able to tackle this feature as there is memory (created in the previous step) for the airport to know how many planes are landed

#### Step 5:
- I'm now going to address the confirmation methods which are not fully functional

#### Step 6:
- Pull request: at this stage, I've decided to submit my first pull request having satisfied four out of six of the user stories.
- Both Hound and Travis passed successfully

#### Step 7:
- Now, I'm moving on to deal with the weather state. I'm not initially sure whether to make weather it's own class or a state of the airport class.
  - Decided to set weather as its own class - thinking ahead, it could be possible for weather to grow considerably and then become too entangled with airport. Also, it could be possible in the future for a flying plane to have a weather state.
  - Currently my use of stubs in the spec files is not very DRY. Need to find a way to set an overall environment and then when testing the stormy exceptions just set a different stub for those specific examples.

#### Step 8:
- Next steps for development are to figure out a way to make my use of stubs in the spec file more DRY. Discovered `before` statements in Rspec which allow you to make a stub apply across the whole `describe` block. You can use `before` instead of `let` - initially got very stuck thinking that needed to use `let`.

#### Step 9:
- Linked Travis CI to my Github account and all tests are passing
- Linked Coveralls to my Github account and turned coveralls on for this repo
  - Have 98% test coverage
- Added status badges for travis and coveralls
- Activated Hound CI on my Github account and again activated it for this repo

Next steps
--------------------

* Write further tests against edge cases and defend against them if there are any test failures
* Write an rspec feature test that lands and takes off multiple planes - will also reveal if there are any remaining edge cases

Ideas for extending
--------------------

* Give each `Plane` an instance variable called 'airport' which logs which airport it is currently in if landed and sets to nil if airborne
* Improve confirm_landing and confirm_takeoff methods which are not currently that sophisticated
