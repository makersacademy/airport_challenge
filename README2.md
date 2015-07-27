PROGRESS:
I have got tests passing in rspec/running in irb for the basic requirements of the challenge. Planes can land and take off, the airport keeps track of whether or not it is full, and planes can't land when the airport is full or whether is stormy.

Assumed weather should be sunny most of the time and made the random number generator biased 2/3 in favour of sunny weather and 1/3 in favour of stormy weather.

ISSUES:
Could not figure out how to write tests for the following:
- Check that method x in Class A causes method y in Class B to be called.
- Tests for 2 different errors to be raised in 2 different scenarios. Somehow one test has to be switched off for thet other one to pass, and vice versa.

Not 100% clear that the right plane is definitely being targetted at all times. Used 'plane' as argument in methods to try to deal with this but unsure if it really does.

Haven't really used doubles - focussed on getting the code and tests right.

Not clear on effect of making methods/objects private.

Issues generally with referring to e.g. the plane when in the airport file. Had to use a parameter 'plane' in order to reference plane within a method, so unsure if that has dealt with it or is a fudge.

Wasn't able to make the methods for landing and taking off in the plane file conditional upon the corresponding methods in the airport file. I.e. plane should not take off until airport has released it, and plane should not land until plane has received it. Theoretically the plane file methods for land and take off can be called separately without the airport methods happening first. Had trouble figuring out how to reference the airport methods within the plane methods in order to do this.

TO COMPLETE:
Resolve above issues, then check to make sure the right plane is being reference at all times.

