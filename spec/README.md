# Airport Challenge

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

### Approach

For this challenge I have decided to treat it in a similar approach as I did with Boris Bikes, while trying not to repeat the same mistakes I went through with the previous challenge. My first step was going through the user stories individually and creating functional representations, followed by a domain model with what would be the Objects and what messages they would respond to. I then noted down a diagram similarly to the process we went through in the Mocking workshop, by drawing out a visual diagram to clear my thoughts.

Firstly, I started with a feature test, followed by writing a spec test and then creating the appropriate methods/classes to pass the tests.


### Notes

In order to make the weather only be stormy occasionally, I have taken the advice suggested in the challenge and used a random number generator from 1 to 10, specifying that it would be stormy when the random number generator returns 10. However I have not yet managed to pass the tests, due to the code written that did not raise an error. This is most likely to do with the mocks that I did not use properly. I have written mocks in two different ways for two tests in order to check which one would pass my test, however none of them did which brings me to that conclusion. The error message shows that I have given the wrong number of arguments in the first way I wrote the double (given 3, expected 0..2), although I have used only two arguments. Another error was that the errors were not being raised, so that is so far where I have gotten stuck.

I have attempted to get deeper into using mocks in order to get a better understanding, but will need to read more/ perhaps do some specific exercises on this before I continue.



### Refactoring

I used the Code Review file to improve the code in my tests, using ``` subject(:airport) { described_class.new } ``` instead of creating a variable for airport in each test, refactoring as I go along.
