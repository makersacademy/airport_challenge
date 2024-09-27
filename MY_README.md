## Airport Challenge

My approach to this challenge was to try and solve it using only one class, the Airport class, even though the user stories ask for at least one more class.

Taking this approach proved at time quite challenging. I spent a lot of time trying to make some tests pass without provoking 7 or 8 other tests to go red. I managed to solve this situations by grouping tests in `describe` and `context` blocks and by doing so, isolating doubles where necessary.

I'm not sure that my tests cover all the user stories and edge cases or even if they are valid but once I will become more confident on my RSpec skills I intend to come back and revise.

All in all this was quite a challenge, and a pleasure to try and solve.

I found very helpful end educational this [YouTube](https://www.youtube.com/watch?v=Vg0cFVLH_EM&t=6537s) video posted by Sam Morgan, showcasing his approach and thinking process when writing the tests. Truly inspirational and eye opener.
