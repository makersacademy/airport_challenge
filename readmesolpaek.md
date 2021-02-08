*READ*ME*SOL*PAEK*

until the app is finished, this will be more of an insight into my thought
process

at this point, I have reached a situation in which a new instance of the Plane
class can land and can take_off. As the conditions for these have not
yet been written, I have simply made each one return true, as to see if the
spec file is interacting properly with the ruby file.

what I need to do now is edit my spec and code so that the new instance of
the Plane class not only lands, but lands at an airport. I am struggling with
this so am now going back to the boris bike challenges.



issue 1:

I have now implemented location updates for when the plane is in the sky
or in the aiport. I have not managed to do this without creating the class
Airport in the plane.rb file, and am looking into how to do this.

    solution 1: I have managed to make this work by requiring both the plane
    and airport files.

    success!

issue 2:

I am currently working on a method to see whether the airport is at capacity.
For now, my spec only checks if the full? function returns true, which I have
told it to do. I have been experiencing issues when trying to implement
counting the number of planes in the plane array, and seeing if that number
is equal to any given capacity.

    solution 2: I have implemented a default number of planes and capacity
    and have a passing test for if the two numbers are the same

issue 2.5:

This solution does not account for if the capacity is less than the number
of planes

    solution 2.5: I simply changed the equals to a less than or equals
    the test now passes for the default capacity value being less than or
    equal to the number of planes


at this point, I am still uncertain that I am comfortable enough with TDD, so
am once again returning to the boris bikes afternoon challenges (I missed a lot
due to illness)


update:

I have now added a couple more features. Firstly, I now have a test to see whether
the airport is at capacity or not. Although this is not fully fleshed out, due
to the fact that the count of planes does not increase nor decrease when a
plane lands or takes off, it still works-ish and I am happy with this.

Secondly, I have a new feature that means that the plane does not land if the
airport is full, and does land if it is not full. The full? is defined by if the
number of planes is less than the capacity or not, but this, as previously
mentioned, is not fully fleshed out.
This is reflected in the tests that expect a false or true based on the
fullness of the airport.

Finally, there is a default capacity which can be edited, and depending on the
number of planes compared to the default capacity, the respective tests work.
This makes me happy.

At this point, I will try to implement the counter's increasing and decreasing
based on the taking off or landing of planes. Wish me luck.

update:

my weather test and function work very basically. I will try to make this
better in the morning.
