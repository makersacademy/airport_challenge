My approach to the task was to tackle each user story sequentially, writing a test and building up the code as the tests required. 

After satisfying the first four user stories I found I had to overhaul the design of the code so instances of the Plane class could be passed into the tests as parameters, instead of being made through a method within the Aiport class. After this things made better sense and answering the final two stories was more straightforward.

Lastly I split the code into separate files and ran Rubocop.

If I repeated the exercise I would have split the code initially and ran Rubocop more frequently so I could have written in this style from the beginning. I also would have commited changes to github when I satisfied each user story.

If I has more time I would make the sunny weather condition a stub when testing, instead of a test argument. Also I would have looked up a more watertight test method for methods with randomness - it doesn't seem great that the test would need to be manually updated if I changed anything about the weather method (eg the names of the weather conditions)