# Airport Challenge

I was given a list of user stories mainly from the point of view of an air traffic controller except for one requirement as a system designer. The project was to create an airport that could land and take off planes with certain conditions attached to those procedures.

## My approach to the project
I wrote down the main objects and messages from the user requirements and shaped a decision map then followed the TDD procedures when writing the code.

eg. first user story
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
This has the air traffic controller as the user of the software. The passengers need to get to a destination, they will be travelling in the plane object and the plane object needs to be able to land at an airport object. The main instruction or message being conveyed is that a plane needs to be able to land at an airport.

I followed the TDD procedure of feature testing in irb first, writing a unit test in rspec, running the unit test and then writing the code for it to pass. Once passed and if necessary I would refactor and run the unit test again. After adding and committing the code I would then move on to the next user story requirement.

### Things I had to consider
Involved in the decision map was the idea of defending against edge cases. I had to make sure a plane could not be cleared to land again if it was already on the ground in an airport or planes that had already taken off are able to take off again even though they were not on the ground.

eg. plane object not being able to land again once on the ground.
```
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fcb0f9c2b10 @planes_on_ground=[], @capacity=8>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fcb0f9bb018>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007fcb0f9bb018>]
2.5.0 :005 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/js/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/js/projects/weekends/airport_challenge/lib/airport.rb:18:in `land'
RuntimeError (plane is already in the airport)
```

Another factor that was to be considered was the weather. A random weather return of true or false to it being stormy was required by the instructions to be used. I created a weather file that containing a module that had a stormy? method. This module was included in the airport class file so that the airport could check the state of the weather (in this case if it was stormy or not) and then prevent planes from landing or taking off if this was true. I did this as I thought that the airport should be checking (as an example) the MET office weather (in this case a weather module) for weather updates. I also decided on checking the weather whenever a plane wanted to land or take off so as to make sure the weather report was always up to date. Stormy weather was decided on a "dice" roll, being that if a 6 was rolled then true was returned for stormy weather.

### Notes on testing
I employed the use of stubbing and mocking in the cases of getting a consistent number returned when running the rand methods within the weather module. In the example below I created a mock class Test to place my module in. I then made the rand method only return a 6 instead of a random number from 1 to 6. This allowed me to consistently test that true was returned if a 6 was returned at random.

    class Test
      include Weather
    end

    test = Test.new

    it 'returns #stormy? as true when 6 is selected randomly from the numbers 1 to 6' do
      allow(test).to receive(:rand) { 6 }
    expect(test.stormy?).to eq true
    end


### Requirements

#### The code for this project was written in ruby 2.5.0

    ruby


#### All code based on the user story

    ./lib/airport.rb
    ./lib/plane.rb
    ./lib/weather.rb


#### All tests can be run through the root directory using rspec

    ./rspec


#### rspec test files

    ./spec/airport_spec.rb
    ./spec/plane_spec.rb    # is here just to check if the plane class exists
    ./spec/weather_spec.rb


## Conclusion

I really enjoyed writing and testing this project. It has a lot of scope to be added to and I found myself wanting to create a few more user stories to add to the ones already stated. I had a bit of trouble getting the stubbing of methods to work but after a bit of research and experimenting I managed to get all my tests to work.
