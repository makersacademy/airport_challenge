# Airport Challenge

[Task](#task) | [Approach](#approach) | [Execution](#execution) | [Demo](#demo)

This is the weekend challenge for Makers Academy - Week 1.

## <a name="task">Task</a>

Below is the task we were given:

*We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:*

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
I am confident that my program fulfills all of these user stories.

## <a name="approach">Approach</a>

#### Domain Models

Having spent the whole week familiarising myself with the principals of Test Driven Development (TDD), and understanding it's importance in driving the production of concise yet eloquent code I have approached this task with that in mind.

#### Feature tests

I broke each user story down into a flow chart, allowing me to create an image of the outcome and the path to it. Using feature tests at this stage facilitated a mental model of the objects, methods and their interactions required to fulfil the requirements of each user story.

#### Unit tests

From here I was able to use RSpec to write specific unit tests that would initially fail. I could then write the code step by step, knowing exactly how I needed to proceed in order to pass the tests and therefore fulfil the requirements of the user stories.

## <a name="execution">Execution</a>

I have endeavoured to follow *Dont Repeat Yourself*, **DRY** and *Single Responsibility Principal*, **SRP**  at all times, extracting functions into private methods and using guard clauses where applicable. Edge cases have been accounted for through rigorous testing using doubles and chained method stubs.

## <a name="demo">Demo</a>

Navigate into the airport_challenge directory and run **irb**.

```
➜  airport_challenge git:(master) ✗ irb
2.4.1 :001 > require './lib/airport'
 => true
2.4.1 :002 > require './lib/plane'
 => true
2.4.1 :003 > require './lib/weather'
 => true
2.4.1 :004 >
```
You will now be able to build airports and planes which will be able to interact (weather dependent).

```
2.4.1 :004 > heathrow = Airport.new
 => #<Airport:0x00000002488da0 @planes=[], @weather=#<Weather:0x00000002488d50>, @capacity=20>
2.4.1 :005 > biplane = Plane.new
 => #<Plane:0x000000023896e8>
2.4.1 :006 > heathrow.land(biplane)
RuntimeError: the weather is stormy
	from /home/lewis/Repositories/Makers_Week_1/airport_challenge/lib/airport.rb:14:in `land'
	from (irb):6
	from /usr/share/rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :007 >
```
Above we created an airport that has a capacity of 20 planes (the default) but we couldn't land our biplane there because the weather was stormy! Maybe the weather will be better this time!

```
2.4.1 :007 > heathrow.land(biplane)
 => [#<Plane:0x000000023896e8>]
2.4.1 :008 > heathrow.planes
 => [#<Plane:0x000000023896e8>]
2.4.1 :009 > air_force_one = Plane.new
 => #<Plane:0x0000000237d258>
2.4.1 :011 > heathrow.land(air_force_one)
  => [#<Plane:0x000000023896e8>, #<Plane:0x0000000237d258>]
```
Ah there we are, the weather is much better for flying so we could land our biplane as well as air_force_one.
