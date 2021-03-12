Airport Challenge
=================

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

Task
-----

To write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories:

```
1. As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

2. As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3. As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

4. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

5. As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

6. As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

My approach
-----

My first step was to represent the objects and messages that I'd need to meet these user stories:

| User story | Object | Messages 
| -----------|--------|----------
|1. As an air traffic controller, So I can get passengers to a destination, I want to instruct a plane to land at an airport | Air traffic controller |
||Plane | 
| | Airport | land(plane)
|2. As an air traffic controller, So I can get passengers on the way to their destination, I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport | (Airport) (Plane) | take_off(plane), check_location
|3. As an air traffic controller, To ensure safety, I want to prevent landing when the airport is full |(Airport)| full?
|4. As the system designer, So that the software can be used for many different airports, I would like a default airport capacity that can be overridden as appropriate| System designer |
||(Airport) | initialize (with default - I picked 10 - and override for capacity)
|5. As an air traffic controller, To ensure safety, I want to prevent takeoff when weather is stormy| (Airport) | weather_now - to check as part of take_off and land
|6. As an air traffic controller, To ensure safety, I want to prevent landing when weather is stormy| (Airport) | (weather_now)
</br>

I then imagined what unit tests I'd need to create to meet them (this was also the structure of my workflow - create the tests, one at a time, see them fail, make them pass, and then refactor). A few of these are edge cases e.g. where trying to land a plane that is already in the airport in question. All of these I went on to test through the airport class, although some of the code function being checked was by reference to the plane class in a separate file:

User story | Unit Test(s)
-----------|-------------
|1. As an air traffic controller, So I can get passengers to a destination, I want to instruct a plane to land at an airport | - should create an Airport instant with Airport.new when given correct number of initial arguments (1..2) </br> - should create a Plane instant with Plane.new when given correct number of initial arguments (1..2) </br> - should raise an error "Plane not airborne" if trying to land when plane is not in the air (could be already in airport or in another airport) </br> - (when a plane is told to land) should add plane to the planes at the airport if there's enough space and weather permits (i.e. is clear)
|2. As an air traffic controller, So I can get passengers on the way to their destination, I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport | - should raise an error 'Plane not present at this airport' if trying to take off a plane which isn't there </br> - (when a plane is told to take off) should remove that plane from the airport inventory as long as it was there in the first place and the weather is clear </br> - plane and airport 'airport_id' should match after landing </br> - plane 'airport_id' should revert to 'IN TRANSIT/AIR' when taking off </br> - check_location should return the correct location for a plane that has taken off ('IN TRANSIT/AIR')</br> -check_location should return the correct location for a plane that has landed (same as airport_id of airport)
| 3. As an air traffic controller, To ensure safety, I want to prevent landing when the airport is full | -'full?' should return true when airport is full </br> -'full?' should return false when airport is not full </br>- should raise an error "Airport full" if trying to land when airport is already at capacity
| 4. As the system designer, So that the software can be used for many different airports, I would like a default airport capacity that can be overridden as appropriate | - should have a capacity of 10 (planes) when not overridden </br> - should have a capacity of 20 (planes) when this is passed in as an argument
| 5. As an air traffic controller, To ensure safety, I want to prevent takeoff when weather is stormy | - should raise an error 'Weather is stormy' if trying to take off when airport weather is stormy
| 6. As an air traffic controller, To ensure safety, I want to prevent landing when weather is stormy | - should raise an error "Weather is stormy" if trying to land when airport weather is stormy

</br>
In addition, whilst not strictly necessary from the given user stories, I thought it prudent to store unique identifiers for each plane and airport, so that handling interactions would be easier from a human point of view (i.e. not having to deal directly with object instance references). For this reason, I thought it would be helpful for each plane object to have a `plane_ID` and each airport to have an `airport_ID` (which I stored in a hash key). Although I didn't introduce any validation, what I had in mind for those values was something like these: 

</br>

Attribute| Format | Example
---|---|---
plane_ID | "Tail number" | G-EBBT for a de Havilland DH.34 registered in 1922
airport_ID | IATA airport code (trigram) | LBA for Leeds–Bradford (Airport)
</br>
Next steps (incomplete)
-----

Additional guidance from the original (Makers Academy) brief
-----
Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
