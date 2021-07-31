This is the first weekend challange, in which a simple air traffic control system
was created using a TDD working method, based on a number of user stories. 


I started tacking the challenge by taking all the user stories and organising the nouns and verbs into Objects 
and Messages, to help we work out what classes and methods would be needed. Once this was done, I then imagined how the user in the first user story would want to use it, this lead to an appropriate feature test. This then led me to write a simple unit test for that method. This process was repeated for each user story, at times even though the unit tests would pass, I would feature test in irb to make sure that the code was doing, and if the unit test failed then I would look at irb to see if variables were what i expected. 

The hardest part was trying to understand stubs to deal with the random nature of the weather, using the guide linked https://www.relishapp.com/rspec/rspec-mocks/docs and the example of using a test double to test a die that’s relevant to testing random weather in the test, seemed to fulfil my needs. However initially I did not understand the exact usage and as such wasnt able to implement the necessary tests, as such I spent some time googling to try to get a better understanding, as well as watching a few youtube videos. As of writing this I feel I need to do more reading and researching to understand mocking and stubbing better. 

As of writing this rspec has passed all 11 unit tests, and I believe I have fulfilled all the user stories. 

rspec results

ahsanrasul@MA322 airport_challenge % rspec

Airport
  lands a plane
plane no longer at airport
  a plane can take-off
  prevents landing if airport is full
  prevents landing if plane is not flying
  prevents a plane from taking off if not at airport
  prevents a plane from landing if stormy
  prevents a plane from taking off if stormy

Plane
  is flying

Weather
  can be sunny
  returns that it isnt stormy
  returns that it is stormy

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.01955 seconds (files took 0.18533 seconds to load)
11 examples, 0 failures


COVERAGE:  98.78% -- 81/82 lines in 6 files

+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  95.83%  | lib/airport.rb | 24    | 1      | 32      |
+----------+----------------+-------+--------+---------+
5 file(s) with 100% coverage not shown