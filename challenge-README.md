First, I planned out what exactly I want my code to do / achieve, based on the user stories.
This can be seen in the "plan.md" file. 

I then ran bundle to install RSpec.

Using TDD, I created the Plane class and the first method, whih reports whether a plane is flying in the air or grounded. I chose to begin with this, because it will influence whether planes can land in the airport or not. 

Having completed this, I moved next to the tests for the "land" method, which would convert a flying plane into a grounded plane. Then I did "take_off", as this was very similar to the "land" process.

After this, I decided to do tackle the "storm" user stories, as this directly linked to the code I had already written. I started a new spec test file for the weather class, and worked out how to created a random generator that would decide if the weather was stormy or clear. Once this was done in isolation, I started to integrate it into the plane spec and class files.

I got blocked trying to get my test for the weather class to pass. Comments on that below (taken from 'spec_weather.rb)
# I wanted these tests to check the storm method was working randomly.
# However, I couldn't get the random element of tests to work. 
# I wanted to replace the "random" test results with purposeful results, to ensure that when a certain number was output, the correct @weather string was returned.
# I attempted to use Stubs and Kernels. But I just was learning this from YouTube / documentation. 