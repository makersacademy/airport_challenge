I used quite a lot of the learning objectives from the Boris bikes challenge - docking and releasing bikes with a docking station isn't so different from landing and taking off bikes from an airport, after all.
Implemented user stories 1, 2, 5 and 6 with (I think) general effectiveness - they should perform their functions and deal with edge cases well enough.

I had a lot of issues trying to implement the weather function, especially when trying to change that seemed to alter my initial spec tests that had passed but were now failing. Eventually I reverted to a previous commit that had my spec tests passing but no implementation of the weather.

feature_test.rb contains some feature tests and the errors that they should raise.
