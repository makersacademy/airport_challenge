This is the first weekend challange, in which a simple air traffic control system was created using a TDD working method, based on a number of user stories. 

I started tacking the challenge by taking all the user stories and organising the nouns and verbs into Objects and Messages, to help we work out what classes and methods would be needed. Once this was done, I then imagined how the user in the first user story would want to use it, this lead to an appropriate feature test. This then led me to write a simple unit test for that method. This process was repeated for each user story, at times even though the unit tests would pass, I would feature test in irb to make sure that the code was doing, and if the unit test failed then I would look at irb to see if variables were what i expected. 

The hardest part was trying to understand stubs to deal with the random nature of the weather, using the guide linked https://www.relishapp.com/rspec/rspec-mocks/docs and the example of using a test double to test a die that’s relevant to testing random weather in the test, seemed to fulfil my needs. However initially I did not understand the exact usage and as such wasnt able to implement the necessary tests, as such I spent some time googling to try to get a better understanding, as well as watching a few youtube videos. As of writing this I feel I need to do more reading and researching to understand mocking and stubbing better. 

As of writing this rspec has passed all 11 unit tests, and I believe I have fulfilled all the user stories. I have a total coverage of 98% where lib/airport.rb only has 95.83% coverage, I believe it is the initialize method, and the full method which is private.

Usage in IRB as follows

2.6.5 :001 > require './lib/airport.rb'                                                                                                                           
2.6.5 :002 > require './lib/plane.rb'                                                                                                                             
2.6.5 :003 > require './lib/weather.rb'                                                                                                                           
2.6.5 :004 > airport = Airport.new                This creates a new airport                                                                                     
2.6.5 :005 > plane = Plane.new                    This creates a new plane                                                                                       
2.6.5 :006 > airport.land_airplane(plane)         This lands a plane at the airport                                                                               
2.6.5 :007 > airport.takeoff_airplane(plane)      This allows a plane to take off                                                                                 
                                                                                                                                                                 
rspec results as follows                                                                                                                                         
                                                                                                                                                                 
ahsanrasul@MA322 airport_challenge % rspec                                                                                                                       
                                                                                                                                                                 
Finished in 0.01955 seconds (files took 0.18533 seconds to load)                                                                                                 
11 examples, 0 failures                                                                                                                                           
                                                                                                                                                                 
COVERAGE:  98.78% -- 81/82 lines in 6 files                                                                                                                       
                                                                                                                                                                 
+----------+----------------+-------+--------+---------+                                                                                                         
| coverage | file           | lines | missed | missing |                                                                                                         
+----------+----------------+-------+--------+---------+                                                                                                         
|  95.83%  | lib/airport.rb | 24    | 1      | 32      |                                                                                                         
+----------+----------------+-------+--------+---------+                                                                                                         
5 file(s) with 100% coverage not shown
