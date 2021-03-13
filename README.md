Airport Challenge
=================

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
How to use
-----

The programme should be used within a REPL like irb. Once within that environment, there are no pre-programmed class instances, so the user will need to instantiate their own planes and airports using a fairly standard syntax before using the available commands (`land`, `take_off` and `check_location`). Examples are given below:


```
**Instatiate plane (system designer):
plane_1 = Plane.new("G-BBFX")
=> the argument is compulsory, giving a plane_id. Note: Your plane will instantiate "IN TRANSIT/AIR". You will need to use land to assign it to an airport for the first time.

**Instantiate airport (system designer):
airport_1 = Airport.new("LGW", 20)
=> the first argument is compulsory, giving an airport_id. The second is optional, giving a capacity. If left empty, this defaults to 10 (planes).

**Instructions to planes (air traffic controller):
*Land: airport_1.land(plane_1)
*Take off: airport_1.take_off(plane_1)
*Report location: plane_1.check_location

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
|5. As an air traffic controller, To ensure safety, I want to prevent takeoff when weather is stormy| Weather | weather_now - to check as part of take_off and land
|6. As an air traffic controller, To ensure safety, I want to prevent landing when weather is stormy| (Weather) | (weather_now)
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
In addition, whilst not strictly necessary from the given user stories, I thought it prudent to store unique identifiers for each plane and airport, so that handling interactions would be easier from a human point of view (i.e. not having to deal directly with object instance references). For this reason, I thought it would be helpful for each plane object to have a `plane_ID` and each airport to have an `airport_ID` (which I stored in a hash key). Although I didn't introduce any validation, what I had in mind for the user to input was something like these: 
</br></br>

Attribute| Format | Example
---|---|---
plane_ID | "Tail number" | G-EBBT for a de Havilland DH.34 registered in 1922
airport_ID | IATA airport code (trigram) | LBA for Leeds–Bradford (Airport)
</br>

Next steps (Fixes)
-----
Most urgently there are a couple of kinks I didn't have time to iron out. The most major (that I caught...!) is that when I finished my first pass of the code, planes could be instantiated with a second optional argument, `airport_id`, indicating their location (with a default value of 'IN TRANSIT/AIR'). The `airport_id` value is not necessarily unique (I don't know a way to validate/enforce uniqueness of airport instances' `airport_id` without adding yet another object), and there is therefore no reliable process to automate the relevant airport 'knowing' that the plane has been instantiated there (in terms of the way the code is written, this would look like the relevant airport holding the plane instance in an array). If I'd left it that way, a plane instantiated anywhere other than 'IN TRANSIT/AIR' would not be able to leave the airport (`take_off`) as the airport will raise an error saying it's not there. Nor could that plane `land` anywhere new, because the `land` method checks that the plane is in the air to deem the request valid.

To fix this I could:

1) Simply remove the option to instantiate a plane alredy in an airport - this what I did
2) Add a flag into plane properties when instantiating that class. The flag would note the plane instance is new so that it can be treated differently as a one-off the first time it tries to take off or land - bypassing the 'no such plane here' error mentioned above. However, this would be a bit messy and would still lead to a mismatch between plane and airport information on where the plane is located until the `land`/`take_off` method is used.
3) Add a method call into the initialize method for planes to ensure it is 'pushed' into the @planes array of the appropriate airport instance (still has the issue of airport_id being non-unique so some difficulty identifying the airport instance with confidence).
4) Create a new object to represent the 'airport network' as a whole, keeping track of all plane and airport instances, and ensuring that only unique airport_id and plane_id can be assigned when instantiating.

There may also be other, better ways of fixing this - please let me know!

Next steps (Features/functionality)
-----
My first thought was actually to do a whole menu structure to separate out the system designer and air traffic controller user story functionality (why should a system designer be able to land planes or an ATC tamper with airport capacity?) and to make the interaction less 'ugly'. The main difference in that implementation would have been to run the whole programme ('airport.rb') from the command line with helpful, programme-generated messages along the way, rather than the more 'raw' irb interaction in this repo, which relies on clunky commands like `plane_1 = Plane.New("LAX", 20)` or `airport_1.land(plane_1)`. 

Changing the code to do this would probably be the main next step I would take. I think it could be done quite easily - in a similar way to the interactive menu in my earlier <a href ='https://github.com/Dominic-Taylor-Dev/student-directory'>student-directory project</a> except probably making the menu a class of its own rather than just a method - but I didn't implement this for a couple of reasons:

1) It would have overcomplicated things, for the actual set of user stories provided
2) I wasn't confident with simulating user inputs for RSpec tests. I think the syntax would run something like this for an 

There is also other functionality that I could imagine implementing, such as making it possible to save airports.