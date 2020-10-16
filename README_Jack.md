I started by writing a basic test that required an 'Airport' class
This failed as the 'Airport' class had not been made yet
I then created the 'Airport' class and rerun the test which then passed

I then repeated this process for the 'Plane' class

I then wrote a test for airport.land(plane) so that I could land a plane at an airport
This test failed as i didnt have and airport method for 'land'
I then defined a method for land
the test then failed as the method didnt take the correct number of arguments
i then added a parameter to the land method
then the test failed as the actual and expected outputs didnt match, so i then wrote the land method to get the test to pass
Once the test was passing i refactored my code, and then run rubocop to ensure it was as simple as possible.
I then committed and pushed these changes to github

I then repeated the same process for airport.take_off

After i wrote a failing test to check for an error to be raised when the airport was full, i created an argument for airport.initialize so that the use could input a capacity, and i set this by default to 5. I then created a private method to check whether the number of planes at the airport was less than the capacity. I then used this private method ('full') in the airport.land method to either output an error or to land the plane (the same way i did it in the original  method). This code was refactored quite a lot and now reads a lot better. 
