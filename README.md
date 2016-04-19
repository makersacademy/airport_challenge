Airport Challenge
=================

Simple programme which allows users to create airports with variable capacity
and '.land' or '.take_off' planes from those airports. Given the ambiguity of
the user story for setting capacity I decided to give the user the option of
setting capacity both at instantiation and afterwards. To prevent the user
shrinking the airport too much (i.e. landing five planes, then setting
capacity = 4) I had to use my own method, as opposed to attr_writer.

Wasn't sure exactly what they meant where they want to be able to 'confirm'
when a plane has landed or taken off. I erred on the side of caution and
granted the user the option of searching for a plane on the ground via the
predicate method '.in_airport?' at any time.

I see the weather as a property of the airport, so
didn't make the weather its own class. The weather is 'checked'
(i.e. re-rolled) everytime a plane tries to land or take off via '.stormy'.

You'll see in a few of the "stop landing when airport
is full" tests that I've 'permitted_duplicates', overriding the '.in_airport?'
method with a stub; is that bad form???

A given airport will track all aircraft that land in its @planes array, and
remove them as they take off. It will throw an error when you:

- try to land an aircraft in the same airport twice
- try to get an aircraft to takeoff from an airport, when it hasn't landed
there yet
- try to make the capacity of an airport smaller than the number of planes
currently on the ground there

I haven't yet implemented explicit protection from:

- a plane being in two different airports simultaneously
- a plane being in the air and in an airport at the same time

My plan to deal with these would be to give each plane an @landed? instance
variable (default to false), which is set to true whenever a plane 'lands'
at an airport and 'false' whenever they take off. This variable would be
checked before landing or taking off, preventing the two edge cases above.

The implementation seems simple enough, but I found that I had to rewrite
many tests to deal with this new behaviour of planes and I didn't leave
enough time it seems :(


by Emmett (emmett.finbarr.walsh@gmail.com)
