## Purpose 

This was a weekend challenge at Makers Academy to create software that can help control the flow of planes at an airport. The user can create a new instance of an airport, which will allow planes to take off from and land there. This incorporates a random element of weather.
Full requirements for this project can be found in the original README.

## Approach

I first created tests, one by one, based on the six user stories provided by the "client", then wrote the code to satisfy each test. 
It made sense to write the test for the sixth user story before the fifth, as determining whether the airport is full implies having some sort of capacity already set up. 
I used Ruby's rand method to simulate unpredictable weather, so that the user can mock conditions at various locations by changing a single number. (Maybe a little lower for Tahiti and higher for Nuuk).
Finally, I made a few alterations: for example, to ensure that the same plane could not be "landed" twice. 
