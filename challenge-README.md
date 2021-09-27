Friday - 
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

After taking a break and coming back in the evening, I realised I don't need a 'weather' class. So I made a method instead. 

When trying to create storm tests, I came across an issue where my plane objects were not updating to "grounded" after they landed (and vice versa). I decided to use numbers, rather than strings to tackle this issue. Meaning that  1 = plane is flying, and 0 = plane is landed. This way I could +/- 1 as appropraite for the @@flight_status class attribute. 

I got this working, but my next issue was using doubles in testing. I understand the concept of what I am trying to do. But cannot get the syntax to achieve what I want, despite trying documentation/Youtube. 
# My doubles which are meant to "guarantee" if there is a storm or not seem to still be randomly giving outputs. Meaning the tests sometimes pass or fail, depending on the random number generator.

Saturday - 
I moved on to creating an airport class. I completed the User Stories relating to having an adjustable limit of planes. However, I ran into issues when trying to assign multiple attributes at once to a Airport instance. I struggled with this for a long time, then decided to just have 2 methods, as a workaround. I created a method that checks the number of planes VS the limit. I went to try and incorporate this into the "land" method, along with a counter. However, I ran out of time. With hindsight, I should've commented out the failing storm code, as this complicated incorporating the counter/limit check methods.