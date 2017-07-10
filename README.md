### Airport && planes
![Airport](http://www.airshows.co.uk/reports/uk/2011/london-city-airport-fun-day/photos/london-city-airport-fun-day-05.jpg)


### Description
This is an interfaceless app designed as software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

I test drive the creation of a set of classes to satisfy all the below user stories. I use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). I stub randomness in my unit tests to override random weather to ensure consistent test behaviour. Weather is still allowed to vary randomly in my feature tests.

### Technologies used
Ruby, RSpec, Capybara.

### User Stories
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

### Configuration and usage

```
* clone this repo
* $ bundle install
* $ rspec
```
