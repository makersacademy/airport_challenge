
## Approach

### Design

Copy user stories into client_stories.txt

Identify the required object classes based on the stories,
Identify the required information that each of the objects would have
Identify the required methods they would need.
(the above is in the client_stories.txt)

Also i had a quick think about the possible argument that were needed,
but decided that as i would be creating the code these would change I didn't write them down

### TDD

The choice of the first test was based not just on the order of the objects identified,
but also I wanted one that would be one that the ATC operator would be actively interacting with.
Then the next Object Class to code would be one that interacted with the first the most.

#### Plane

Set up the basic tests of the Plane class
Pass the tests
Refactor the spec file and code file as needed

Note that as this was before i looked at Doubles the test used string for the airports

#### Airport

Set up the basic tests of the Airport class
Pass the tests
Refactor the spec file and code file as needed

Also done before checking out Doubles

#### Weather

Set up the basic tests of the Airport class
Pass the tests
Refactor the spec file and code file as needed

### Final Refactoring

Identify methods that were doing too much, creating new methods such that each filled the SRP in my opinion
Make all inward facing methods private
Double check with rubocop about any guideline violations, make those changes (including adding code to make it happy airport:49-50)

## Comment about Weather being so empty

I feel that as I identified at as weather wanted to not have much inside it (as the weather its self should be talking to the operator)
Though I am now slighy tempted to make a WeatherStation class, which would potential simplify the code in the Airport class.
