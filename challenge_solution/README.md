This is my solution to the airport Friday challenge.

To start with I have initialised rspec and created 2 test files, one for airport.rb and one for aeroplane.rb

Then I have written my first test for landing an aeroplane, to make this pass I created an array for the planes that have landed and defined a method that adds planes to this array.

Next I have written a test to allow planes to take off, to do this I will write a method that removes planes from the landed array.

Next I have written a test to stop planes from taking off when weather is stormy, to do this I will create a variable called weather that randomly selects a weather system (from a range of numbers) and adapt my takeoff method depending on the weather.

Next I have written a test to stop planes from landing if the weather is stormy, to do this I will adapt my landing method to use the weather in a conditional.

Next I have written a test to stop planes from landing if the airport is at max capacity, to do this I will adapt my landing method to use capacity in a conditional.