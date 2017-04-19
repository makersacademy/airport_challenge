
Jaiye Senbanjo - Mini Code-Review - Airport Challenge

Rspec
I should introduce contexts to by tests.
I did not test randomness correctly.

Code
I think I made some fairly large dependency violations;
I wrote 'instructing a plane to land' as `plane.land`
I passed independently instantiated weather and airport to the plane objects as `plane.land(weather, airport)` which i think is the dependency and responsibility voilations.

I “know” now that airport should call the land method on plane but `airport.land(plane)` looks to me like land is being called on airport - although clearly it is being called with the plane object as an argument which makes sense.

I then end up sending `airport.release(self)` from plane to get the airport to remove the plane object from its array which you explained this morning is unwise.

I realise now that my airport objects cannot have their capacities altered. I forgot to do this but I understand how to.

I should make improved implementation of encapsulation by making more methods private

I need to better research Feature-Spec testing.
The feature test I wrote causes errors and I am doing it wrong.
