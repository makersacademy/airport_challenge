Airport Challenge
=================

My approach to solving this challenge was to start with an Airport class, build it as much as I could until I needed to start understanding how one class object would change another. I did pretty well with a TDD approach until the last few problems arose where I didn't know how to write the tests to get what I wanted to happen. Because I didn't know how to even make the code work. It involved a lot of playing around in pry and tweaking until there was some semblance of satisying the user stories.

My approach could definitely be improved upon, but I found this challenge immensely interesting. The most difficult thing I found was keeping the tests in isolation with mocks and stubs because of the way I solved this challenge. I think there was definitely an easier way.


Weather
---------
* I found it conceptually simpler to have weather be simply a true/false airport attribute labelled 'stormy'.
* The User Story indicated this was acceptable by saying only prevent take_off and land when it is stormy.
* This also allows different airports to generate their own weather

Airport
=======
Land method
---------
* Airports couldn't land planes that were already at an airport.
* This meant a plane would have to have a location attribute which the airport checked before allowing it to land.
* Which meant that an airport needed to tell the plane where it had landed by having its own name attribute and changing the plane's location attribute upon a successful landing.

Take_off method
* Airports couldn't tell planes to take off that were flying, not at the airport, or when it was stormy.
* For me that was 3 guard conditions and a way to modify the attribute of a plane upon a successful take off.
---------

Planes
---------
* I didn't want the in_flight attribute to be writeable, just readable. In which case I couldn't set it from the Airport class, and I couldn't call a private plane method from the airport class, so I decided to have public methods to access from Airport, but with guard conditions to ensure a plane couldn't call a lands or a takes_off method on itself, only an airport could do so successfully.
* Interestingly a problem developed when instantiating a Plane because an Airport couldn't immediately give it a location. And thus an airport couldn't give land it and tell it to takes_off. So I used a workaround solution that involved an airport method to park a newly created plane in an airport. And then it could take off.
* As a result every plane has a location and a flight status attribute that is modified when an Airport tells it to land or take off. It can never be in more than one place.
