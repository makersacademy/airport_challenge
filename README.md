# Airport

[Source](https://github.com/makersacademy/airport_challenge)

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

## User stories

> As an air traffic controller   
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport  

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport  

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full 

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate

> As an air traffic controller  
> To ensure safety  
> I want to prevent take-off when weather is stormy 

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy 

## Domain Model

| **Objects** | **Messages** |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Air Traffic Controller |  |
| System Designer |  |
| Airport | **land(plane)** - only if Airport is not full and weather is not stormy<br>**take_off(plane)** - confirms it is no longer in airport, only if weather is not stormy<br>**check_weather** - 0.2 chance to set @weather to "Stormy", else "Sunny"<br><br>**@capacity** - capacity of @hangar, defaults to 5<br>**@hangar** - array for storing planes<br>**@weather** - describes current weather: "Stormy" or "Sunny" |
| Plane |  |

## Requirements

Separate files for every class, module and test suite.

Use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy).  
Use a stub to override random weather to ensure consistent test behaviour.

Defend against edge cases:
- Planes can only take off from airports they are in
- Planes that are already flying cannot take off and/or be in an airport
- Planes that are landed cannot land again and must be in an airport

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
