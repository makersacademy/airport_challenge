What was this challenge?
Brief explanation, link to Makers repo
https://github.com/makersacademy/airport_challenge

How did I approach solving this challenge?

This was written retrospectively so is from memory (but glancing through the git log helped!)

1. User stories on index cards (mac stickies!) (screenshot)
2. user stories to Object   behaviour/method table (photo)
3. interaction diagram/model (photo)
4. At this point I made a design/implementation decision (which I later reversed) that the user requirement of instructing planes to land/take off would be covered by the air traffic controller being the User (hence they would be controlling everything) so these didn't need specific methods - planes were responsible for the behaviour of planes (i.e. landing and taking off) therefore the methods off them housing themselves and removing themselves from Airport instances would be their own doing. I did worry about this so sketched out my other approach (later adopted): see photo.
5. I started by working with the Airport class as this is where the requirements came from (and would require the other classes - the first the program should know about planes or weather is when a plane is instructed to land).
6. I turned my user stories into discrete tests (see post-its image) and TDD'd them - write test, Red, Green, Refactor.
7. As I didn't have my other classes yet I used mocks to substitute them and imitate their behaviour - I had an idea of what this would be thanks to my diagram from before. Due to the randomness in the Weather class that had to be mocked and stubbed.
8. Part way through it became clear that the method which started off a plane being called into the airport should be called by the airport - fortunately this a) didn't require too much work and b) I had my sketch from earlier about how I would implement that.
9. Repeat for Weather class, repeat for Plane class. We grow older.
10. I only started feature testing when I got to the edge cases, as it wasn't entirely clear from my design model what the behaviour would be. I quickly realised when feature testing whether a plane that was already in an airport could land there again (it could) that I needed to thoroughly unit test these edge cases.
11. Repeat TDD process again (see image).
12. At this point I'm as happy as I can be with it, I think, although doubts still linger about those doubles, so I branch it and run the tests I can with their real class instance counterparts. And they still pass, so I drift down the river of sleep and clean this up tomorrow.


This is a retrospective remembrance with a narrative bias but I think it mostly sums up my process.
