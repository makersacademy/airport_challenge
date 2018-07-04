Airport Challenge
=================
[![BCH compliance](https://bettercodehub.com/edge/badge/nixlim/airport_challenge?branch=master)](https://bettercodehub.com/)

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
Update
---------
#### Approach to solving the challenge
*Creating the DOM model*

I started with breaking down the User Stories into DOM, as follows:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

|Object|Message|
|:---:|:---:|
|ATC|
|Airport|.order_landing
|Plane|.land

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

|Object|Message|
|:---:|:---:|
|ATC|
|Airport|.order_takeoff
|Plane|.takeoff
| |.confirm_no_longer_in_airport

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy
```

|Object|Message|
|:---:|:---:|
|ATC|
|Airport|no takeoff
|Weather|if stormy

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy
```

|Object|Message|
|:---:|:---:|
|ATC|
|Airport|no landing
|Weather|if stormy

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```

|Object|Message|
|:---:|:---:|
|ATC|
|Airport|no landing
| |if full

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

|Object|Message|
|:---:|:---:|
|SysDesigner|
|Airport|set capacity

I also summarised additional conditions:

- weather: normally sunny, rarely stormy;
- planes 

   - can only take off from the airport they are in;
   - when flying:
    
      - cannot take-off;
      - cannot be in airport;
   - when landed:
   
      - cannot land again;
      - must be at an airport.

I decided that the easiest way to determine the state of the plane was by reference to an airport ID passed to the plane on landing. This ID is determined by Ruby's `__id__` method and is unique to every object. Thus, when the plane lands, it is given the airport's ID which then tells us that the plane has landed (ie it has an airport ID) and will prevent takeoff order coming from the wrong airport since the plane will check the airport ID of the airport giving a takeoff order against the airport ID of the airport it is parked in. This will therefore deal with the edge cases:

- if a plane is parked, it cannot land again, since it already has an airport ID stored;
- if a plane is in flight, it cannot takeoff again, since it does not have an airport ID stored;
- is in the airport when it has an airport ID stored; and
- is in in flight when does not have an airport ID stored.

On the basis of the above, I proceeded with defining my classes.

#### Classes & methods

**Airport Class**

- Responsibility: Directs planes
- Lives in: `lib/airport.rb`
- Spec lives in: `spec/airport_spec.rb`
- *Airport Class Methods*:

   - `new` - eg `Airport.new` | takes two optional arguments: (`capacity:` and `weather_station`)
   
      - `capacity:` - eg `Airport.new(capacity: 20)` - allows changing default capacity of the airport (default capacity is set to 1)
      - `weather_station` - eg `Airport.new(weather_station: SpecificInstanceOfWeatherStationClass)`- allows assigning a specific weather station to the airport. Default value will create a new instance of `WeatherStation` class
   - `planes` - an attribute, initialised as an array, that keeps track of parked planes
   - `capacity` - an attribute, initialised as an optional value (as per above) or set to default by reference to a constant
   - `weather` - an attribute, stores weather reports on each `check_weather`
   - `order_landing(plane)` - takes instance of `Plane` class as an argument, performs a weather check and capacity check, orders the plane to land (as appropriate), passes it the airport ID and records the parked plane in `planes` attribute (TODO: probably needs some refactoring)
   - `order_takeoff(plane)` - takes instance of `Plane` class as an argument, performs weather check, orders the plane to take off (as appropriate), tells the plane the airports's ID for verification purposes, removes the plane from the `planes` attribute (TODO: probably needs some refactoring)
   - `check_weather` - checks the weather (helper method)



**Plane Class**

- Responsibility: Operates individual plane
- Lives in: `lib/plane.rb`
- Spec lives in: `spec/plane_spec.rb`
- *Plane Class Methods*:

   - `airport_id` - an attribute used for edge cases and takeoff verification
   - `land(airport_id)` - takes `airport_id` as an argument, carries out verification check for edge cases, lands the plane, stores provided airport ID in `airport_id`
   - `takeoff(airport_id)` - takes `airport_id` as an argument, carries out verification check for edge cases, takes the plane into the air, wipes `airport_id` and confirms that it has left the airport

**Weather Station Class**

- Responsibility: Reports weather
- Lives in: `lib/weather_station.rb`
- Spec lives in: `spec/weather_station_spec.rb`
- *WeatherStation Class Methods*:

   - `report` - samples weather from a constant `WEATHER` with 1/5 chance of 'stormy' weather

#### Running tests

Run `rspec -fd` from the project directory to run the entire suite.

To test just the:

- Airport Class: run `rspec spec/airport_spec.rb`
- Plane Class: run `rspec spec/plane_spec.rb`
- Weather Station Class: run `rspec spec/weather_station_spec.rb`

Each class is tested in isolation using spy doubles and stubs.

#### Examples
##### Basic Usage

```
"First, we require our class files"

[2] pry(main)> require './lib/airport.rb'
=> true
[3] pry(main)> require './lib/plane.rb'
=> true
"Weather station is required from Airport"
```

```
"Create new airport with default values"

[6] pry(main)> airport =Airport.new
=> #<Airport:0x00007f8c7e963a68
 @capacity=1,
 @planes=[],
 @weather_station=#<WeatherStation:0x00007f8c7e963a40>>
```

```
"Create a plane"

[8] pry(main)> plane_1 = Plane.new
=> #<Plane:0x00007f8c7f9d63a0>
```

```
"Airport orders the plane to land"

[10] pry(main)> airport.order_landing(plane_1)
=> [#<Plane:0x00007f8c7f9d63a0 @airport_id=70120697961780>]
```

```
"Check the status of our airport after landing"

[12] pry(main)> airport
=> #<Airport:0x00007f8c7e963a68
 @capacity=1,
 @planes=[#<Plane:0x00007f8c7f9d63a0 @airport_id=70120697961780>],
 @weather="sunny",
 @weather_station=#<WeatherStation:0x00007f8c7e963a40>>
```
```
"Order the plane to takeoff"

[14] pry(main)> airport.order_takeoff(plane_1)
RuntimeError: Takeoff prevented, stormy weather
from /.../airport_challenge/lib/airport.rb:24:in `order_takeoff'

"Could not take off since the GOD OF RNG said the weather was stormy. We can check that"

[16] pry(main)> airport
=> #<Airport:0x00007f8c7e963a68
 @capacity=1,
 @planes=[#<Plane:0x00007f8c7f9d63a0 @airport_id=70120697961780>],
 @weather="stormy",
 @weather_station=#<WeatherStation:0x00007f8c7e963a40>>

"@weather attribute confirms that it is stormy"
```

```
"Let's try again"
 
[20] pry(main)> airport.order_takeoff(plane_1)
=> #<Plane:0x00007f8c7f9d63a0 @airport_id=nil>

"Check the status of the airport after takeoff"
[21] pry(main)> airport
=> #<Airport:0x00007f8c7e963a68
 @capacity=1,
 @planes=[],
 @weather="sunny",
 @weather_station=#<WeatherStation:0x00007f8c7e963a40>>
```

```
"Create a second plane to test capacity and edge cases"

[22] pry(main)> plane2 = Plane.new
=> #<Plane:0x00007f8c7fa02220>

```

```
"Park the first plane and then try to park the second"

[23] pry(main)> airport.order_landing(plane_1)
=> [#<Plane:0x00007f8c7f9d63a0 @airport_id=70120697961780>]
[24] pry(main)> airport.order_landing(plane2)
RuntimeError: Cannot land, airport full
from /.../airport_challenge/lib/airport.rb:17:in `order_landing'

```

``` 
"Create a second airport to check the airport ID verification"

[25] pry(main)> airport2 = Airport.new
=> #<Airport:0x00007f8c7e0dae50
 @capacity=1,
 @planes=[],
 @weather_station=#<WeatherStation:0x00007f8c7e0dae28>>

"Order plane_1 to take off, order issued by airport2"

[28] pry(main)> airport2.order_takeoff(plane_1)
RuntimeError: Instructions received from wrong airport
from /.../airport_challenge/lib/plane.rb:15:in `takeoff'

```

And so on... 


Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
