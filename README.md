unfinished.

currently:

can instruct planes to either take off and land

airport has 3 runways

planes are only allowed to land if the weather is sunny, there is an available runway and the plane has not already landed.

planes are only allowed to take off if the weather is sunny, and the plane has not already taken off (however, there's currently a logic problem that causes a nonsense scenario with this).

I've tried to stick to the single responsibility principle so methods call other methods where possible. I think there may be a chance of reusing the plane_present method for both taking off and landing, if I can work out the logic of how to do that.

While it doesn't strictly happen this way in the real world, the weather conditions are part of the airport construct. When an instance of Airport is created, it will be given a randomly assigned weather condition.

For ease of testing in IRB without having to exit and restart, the method .random_weather can be used to re-assign weather. This is really only for feature testing.
