# Airport Challenge

This is a program which simulates airports, planes and weather which affects the planes ability to land and take off. Two separate files were made for the Airport class and the Plane class, as well as two corresponding spec files and a feature_spec file at the end for testing.

## Getting Started

Type the following commands in the folder you want to save this program in:
```
git clone https://github.com/jmcnally17/airport_challenge.git
bundle
```

## How To Use

Navigate to the [lib](./lib/) folder in your local repository. To use in irb:
```
irb
require './plane'
```
Then use the methods present in the [airport](./lib/airport.rb) and [plane](./lib/plane.rb) files to play around.

## Running Tests

Navigate to the [main](./) folder and run `rspec`.

### Approach

Both airport and plane classes were both initially made with the hangar array instance variable test in the airport being made first in order to have a place to store the planes when they land. The landing function was then tested by simply adding a plane into the hangar array of an airport and checking it was present in the array.

The take off method was then tested by checking that the plane was no longer present in the hangar array after the take off method was called on the plane. Three tests were added to check the plane was being returned at the end of the method, the hangar array no longer contained the plane and the method printing a message to tell the user that the plane had left the airport. Although, the latter test was later removed as it felt unnecessary.

The land method was then tested and updated to account for a plane trying to land when the airport is full by raising an error message when the plane calls the land method on the airport. An arbitrary number of 60 was chosen for this test. Another test for a plane trying to take off from an airport that it is not in was also made by raising its own error.

The test for a default capacity was then added to the airport class with the ability to change this to any value the user gives by using an instance variable in the initialize method with a default parameter. All existing tests and methods that were required to use this instance variable from the airport class were then updated accordingly.

A couple of edge cases were then tested for when a plane tries to land when it is already in an airport and when a plane tries to take off when it is already flying. This was helped by creating an instance variable called state which stores whether the plane is in a state of "Flying" or "Landed".

Weather at an airport was then tested by using random number generation to create weather that would affect whether or not planes could take off or land. Initially, an instance variable for weather was created but this made the process of testing too complicated and so a simple weather method was created in the airport class instead. Sunny weather allows the planes to land and take off whereas stormy weather prevents the planes from doing either. Tests for this weather method were also added to the airport spec file.

Finally a feature test was created to first check multiple planes landing and then taking off.

Doubles were used in the spec files in order to isolate unit tests. 
