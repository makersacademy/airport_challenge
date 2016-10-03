The entries below describe my thought process and difficulties at various stages of the challenge.

Was having real trouble trying to test whether the class responded to subject.New before realising that none of the tests would work if the class didn't exist. Tried a few methods to test whether the initialize method was working correctly but wasn't successful. May be barking up the wrong tree. I feel this is the sort of thing that could be sorted really quickly with a pair partner.

I'm having trouble reading the rspec documentation. I don't know how much of it is still relevant, working or accurate as there are so many ways to do the same thing. I don't have any confidence that the things I'm reading are accurate and I'm finding it hard to understand. I don't know how to use the examples they give as I don't understand what they are doing. The syntax is very confusing.

I want to write a test that checks whether the parameter I pass to a class method is assigned to an instance variable. I have no idea how to write this. I have spent a long time wondering whether it's even possible to test for this and asking myself what the point of the test would be as it's blindingly obvious whether it does this or not from looking at the code. I'm leaning towards concluding that rspec is good for testing more complex features but that for the simplest elements of a program it's best to create them without testing them.

9pm Sunday night - Decided to write the program and then write rspec tests afterwards. I am aware that this goes against the practice and purpose of TDD and decided to do it because my rspec syntax ability is very far behind where I want it to be and I will learn the syntax more quickly if I can isolate the thought process of writing the test from having to work out what the program needs to look like to pass it. My problem is not the process of TDD, but stumbling over rspec syntax due to my current low level rspec vocabulary. I am aware of the benefits and system of TDD.

SYNTAX - How do I check whether a class method stores the parameter passed to it as an instance variable?

QUESTIONS ---------------

How do I remove a specific plane from an array? Pop only useful if it's on the end. This may be useful but haven't time to test it now: airport::planes.select { |a| a == self}
SOLVED ABOVE - used Array.delete

Why does my rspec look so different? Coveralls doesn't seem to have loaded properly. Missing my .....F.. at the top :(

  Why does my Plane flying status fail if I put a ? on the end? rspec tells me "syntax error, unexpected '='"
