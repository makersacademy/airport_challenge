# Airport Challenge #

This airport program has features for taking of and landing planes in an airport. I pushed planes into two separate arrays called `landed_planes` and `airborne_planes`. I did this to make things easier to understand and manage.

I used an array of symbols and used `.sample` on the array to generate a random weather outcome and used stubs in my `rspec` tests to ensure the tests ran properly.

I didn't manage to account for the main flaw in the program that is, you can still call the `take_off` method on a flying plane, and likewise, call the `land` method on a landed plane.

I ran out of time but I have the basis of how I might have solved these issues already in my plane.rb file. I was going to assign a true or false value to the `@flying` instance variable and use that to raise errors in my `land` and `take_off` methods, similar to how I did for capacity checks.
