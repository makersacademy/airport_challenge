# README

### Approach

I started this challenge by creating two classes: `Airport` and `Plane`. I knew that I would want my Airport class to be able to land a plane, so I created a method within the class and unit-tested it to check that an airport would respond to it. I then added an argument to the method, which would be filled by the plane that wanted to land.

Next, to keep a record of what planes had landed at which airports, I created an instance variable on the Airport class called `@plane`. I initialized this on the class with an attribute reader. I also added the method to allow a plane to take off.

However, I was then aware that an airport would only be able to hold one plane, and that returning the plane and unassigning the instance variable on take-off would be difficult/messy. So I created an `initialize` method on the Airport class, changed `@plane` to `@planes` and assigned it an empty array. Now, when a plane lands it is added to the array, and when it takes off it is removed from the array using Ruby’s `.shift` method. I also added a `confirm_take_off` method to the Plane class that would return true if an airport (supplied as an argument) did not contain the plane in its `@planes` array.

I realised there was an undesirable behaviour in which one plane could land at the same airport multiple times. To solve this I introduced an error to the land method that would not allow a plane to land if it had already landed there, i.e. it was part of the airport’s `@planes` array.

However, I then realised another problem: an instance of `Plane` was able to land at multiple airports simultaneously (just not the same airport twice)! My solution was to add an instance variable called `@landed` to the `Plane` class which can take a value of true or false.

Accessing an instance of Plane’s `@landed` attribute in a method on Airport was initially difficult. I changed the attribute reader on Plane to an attribute accessor so that methods outside of the class could modify it. Then it was a simple case of making sure that whenever a plane lands or takes-off, its landed attribute changed to reflect that. Also, I made sure that a plane was now not able to land if its `@landed` attribute read true, rather than if that particular instance of Airport contained the plane. Now, planes are only able to land at one airport!

To add complexity to this program, it should be possible to add error messages that tell you which airport the plane is landed at if you try to land it when it’s not “in the air”! To do this, I would add another instance variable to the Plane class that records the airport it is landed at when using the .land method.

Next I removed the `confirm_take_off` method from the `Plane` class. The test was very similar to that which I was now using to test if the plane had `landed`, and it seemed to fit the brief better if instead of the user needing to ask a plane if it had taken off, instead the `take_off` method `puts`ed a string to the console confirming that the plane had taken off.

Worth noting: the `puts`ed message interpolates the instances of plane and airport as their memory key, rather than a variable name… I am currently unsure how I would change this!

I then created a class called “Weather”. The method `generate_weather` comes up with a random number between 1 and 10, then returns a string depending on the randomly generated value. If the number is 1 it returns “Stormy”, any other number is “Clear skies”.

Then I decided to change `Weather` from a class to a module. This way Weather’s methods would be available to the Airport class. I assigned an instance variable of `@weather` to `Airport` which is randomly generated using the `generate_weather` method, so it will either be “Stormy” or “Clear skies”. Each time a plane tries to land at an airport the weather at the airport is randomly generated.

Feature tests in irb at this stage seemed good. However, this was the point where I could not get my unit tests to pass. I tried to create a test that would set the weather as “Stormy” at an airport so that when a plane tries to land it gets an error message. However, the test passed inconsistently. My guess is that this line:

```ruby
@weather = self.generate_weather
```

at the top of my `land(plane)` method is somehow still randomly generating the weather, so the test is not successfully forcing the weather to be “Stormy”.

This is the point at which I ended the challenge.

### Plan to finish

I did not complete the following requirements:

- Prevent landing when the weather is stormy.

	To achieve this, I would follow a similar process as with preventing landing in bad weather, once I figured out how to run a successful Spec unit test on the error.

- Prevent landing when the airport is full

	To do this I would introduce a `fail` error to the `land` method that is returned whenever a plane tries to land and the length of the array of landed planes is at a certain threshold (perhaps 20 planes).

- Set a default airport capacity that can be overridden as appropriate.

	To complete this, I would assign Airports an instance variable of `@capacity` with a default value of 20 upon initialization. I would then include a method that allows the program’s user to input an integer to reset the value of `@capacity`.
