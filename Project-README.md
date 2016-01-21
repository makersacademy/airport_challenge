AIRPORT CHALLENGE
This is Rufus Raghunath's week 01 weekend challenge
Makers Academy
Jan 2016

---------------------------------------------------

ABOUT THE CHALLENGE:
Lorem Ipsum


MY APPROACH:
I started out by going through the user stories and writing out the classes necessary to satisfy the task requirements, as well as the actions those classes would need to perform (see ./docs/user_stories.md). This allowed me to have a solid overview of the bare-bones functionality this project required before writing any code. (Similar to how we wrote out the nouns and verbs for the user stories in Boris Bikes, except more focused on the nouns and verbs actually relevant to the code). The next step was simply to set up doc and spec files for each class and then go through the actions necessary to have a functioning airport step by step, writing tests for each action and then making the tests pass.

While it was obvious to make separate classes for Plane and Airport, Weather was a bit more ambiguous. Originally I wanted another class, but since it would make no sense to have to call Weather.new I decided to make it into a module, so that any objects needing to refer to it could call on its code without there having to be a “weather object”. Of course, I could have just made a .weather method for Airport, but it didn’t make conceptual sense to me to have the weather exist only in the context of airports. Just as real airports are dependent on external weather conditions, my Airport objects are dependent on an external module. Plus, if we were to extend this virtual world any other classes that have to refer to the weather could simply include the module, too.

