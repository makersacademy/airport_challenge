I copied the user stories into a text document then made a note of the nouns and verbs, therefore the objects and methods, 
that I would need in order to meet the functionality. Then I created the necessary files.
I drafted some code in the sourcecode files, because I needed to know how I was implementing the user stories
in order to write good code for it. I then hashed this code out, wrote a test, saw it fail, unhashed the code,
and then re-worked the code until it passed. I repeated this, sometimes re-working the tests as well, especially
as the use of doubles means that one has to describe the functionality of a double before it can be tested, and
this functionality wasn't immediately obvious to me.

There was no need for modules or shared examples in my implementation.

I made use of rubocop at the end to tidy up code.

My code currently requires planes to be told that they have landed. This is to prevent double landing. 
It is counter-intuitive that a plane should need to be told this. The other solution would involve airports checking 
with each other that a plane hasn't already landed there, but this is also counter-intuitive and if you don't check all the airports,
there check will fail. 
