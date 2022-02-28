# **Weekend Challenge 1 - Airport**

I mainly referred to my code from the Boris Bikes challenge, which made the process of writing the initial tests and codes a lot less intimidating than it could have been. For reference I had a look at this particular task earlier in the week (before doing the Boris Bikes challenge), and it seemed very scary at the time... to me that just shows how much progress one can make in a few short days.

The biggest challenge here by far was trying to get the testing doubles and stubbing to successfully manipulate the random number generator. Even after some continued effort experimenting with different tactics, unfortunately the only way I could get the tests to pass was to have the weather exception be the first one considered in my code (so I didn't have to land a plane in my test while the weather is stormy, just to test if it could take off or not in the same weather).

Aside from that, I imagine my biggest weakness is going to be the lack of refactorisation in my code. It's not always immediately apparent when I'm writing code what could be shortened/left out, so some guidance on that would be much appreciated. Thank you.
