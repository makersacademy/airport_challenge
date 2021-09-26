# Airport Challenge Attempt (Bernard Leanse)

First I drew up a miro board for the domain model 
https://miro.com/app/board/o9J_luwA0gc=/

wrote tests and made airport and plane classes
made it so the airport handles taking off and landing of planes

The plane tests are for checking if the plane is in the airport, keeping this test isolated
by creating a mock object for the airport and using a stub to give this airport double the ability to respond to what planes it has depending on what I'm testing.

Tackled the rest of landing and taking off using mock planes testing from the airport spec.

Introduced weather as a class which would be stormy one in a hundred times it's initialized. 
This affected tests as I now needed to pass this weather object into landing and taking off so these methods could know the weather. I used stubs to keep the weather not stormy for the other tests apart from testing that an error would be raised for landing or taking off in stormy weather.

When irb feature testing I would have liked to find a way to not have to have a weather object needing passing into every time landing and taking off, would like this to have been in the background but was unable to figure out the best way to do this in the time available.
