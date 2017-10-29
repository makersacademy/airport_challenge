Approach & INSTALLATION
---
 Download the repositori, with your terminal go in the main folder, require the spec file and start playing: <br >

 [1] pry(main)> require '/Users/marcovanali/Desktop/Projects/Weekend_Challenges/airport_challenge/lib/airport_class.rb' <br >
 => true <br >
 [2] pry(main)> airport = Airport.new <br >
 => #<Airport:0x007fa50c038e60 @capacity=10, @hangars=[], @weather=#<Weather:0x007fa50c038d48>> <br >
 [3] pry(main)> plane = Plane.new <br >
 => Plane:0x007fa50baf4030 <br >
 [4] pry(main)> airport.land(plane) <br >
 => Plane:0x007fa50baf4030> <br >
 [5] pry(main)> airport.take_off(0) <br >
 => Plane:0x007fa50baf4030> <br >
 [6] pry(main)> airport.land(plane) <br >
 RuntimeError: The weather is stormy, the plane can't land. <br >
 from /Users/marcovanali/Desktop/Projects/Weekend_Challenges/airport_challenge/lib/airport_class.rb:23:in 'land' <br >
 [7] pry(main)> <br >




To solve the challenge I started having a look to all the files contained in the folder.
Then I focused on the README.md file and read the instructions.

I Started with the first User story and created a table for it.


Object | Message
------------ | -------------
Air Traffic controller |
Plane| Land at airport


Once the table was ready I organized the classes tree in my mind, and thought how to organize the possible methods.
Then I created the first two classes, Airport and Planes, in two different files.
I started with a feature test, which of course gave me errors.
I made the unit test, and edited my code creating the right method for landing.
Once my method was ready I ran rspec to let pass the Unit tests.

If the coverage was less than 100% I built more useful tests.
Always checked if Rubocop was happy.
Once everything was green and rubocop didn't find any offence I commit the task.
After a research on Internet, to commit I used a template + the vim editor to write better commits.

Difficulties
---
Initially I was a bit struggling trying to figure out how to organize the class and methods.
"Is the plane that need a method to go into the airport, or the class airport need a method to take the plane?"
I was also trying to make a sky_space which kept the departed airplane but was useless in this case.

For this challenge when struggling I used a lot Google for researching and my own notes.

I have solved all the user tasks. Or better, the user story about the weather, initially, I solved it in my way. Then I changed my approach refering to the review file after that the test that need to avoid randomness keep failing.
Initially, to solve the weather task I created in the Airport Class just an instance variable named @weather, equal to an array. 4 of five element were 'sunny' one 'stormy'.
In base of what .sample took from this array the weather was choosen. I tested my code on Pry without any problem, and in the spec file using the attr_accessor to avoid randomness and setting a specific value to the @weather array (@weather = ['stormy']). It worked.
Reading in the review later, I saw that I had to use stubs so I riorganized my code with a Weather class.(Use the attr_accessor to reduce randomness is a bad way?)
I did it, and actually in Pry my code works.

[1] pry(main)> require '/Users/marcovanali/Desktop/Projects/Weekend_Challenges/airport_challenge/lib/airport_class.rb' <br >
=> true <br >
[2] pry(main)> airport = Airport.new <br >
=> #<Airport:0x007fa50c038e60 @capacity=10, @hangars=[], @weather=#<Weather:0x007fa50c038d48>> <br >
[3] pry(main)> plane = Plane.new <br >
=> Plane:0x007fa50baf4030 <br >
[4] pry(main)> airport.land(plane) <br >
=> Plane:0x007fa50baf4030> <br >
[5] pry(main)> airport.take_off(0) <br >
=> Plane:0x007fa50baf4030> <br >
[6] pry(main)> airport.land(plane) <br >
RuntimeError: The weather is stormy, the plane can't land. <br >
from /Users/marcovanali/Desktop/Projects/Weekend_Challenges/airport_challenge/lib/airport_class.rb:23:in 'land' <br >
[7] pry(main)> <br >


 But unfortunately I didn't figure out to let pass the error tests, avoiding randomness using a stubs. Probably I am missing something about the stubs.
 I will try with more research and help.

 ##To be improved
 ---
   - Let pass the tests that reduce randomness to test Error when weather is stormy.<br >
   -Let the 'take_off' method check if @hangars is empty before to try to delete  a plane, and raise an error.<br >
   -Create a Unit Test to check if 'take_off' method let take off exactly the     instance of Plane you choose.<br >
    Same thing for land().<br >
   -Improve the code following the review file.<br >

Support
---
http://www.betterspecs.org/
https://relishapp.com/
https://chris.beams.io/posts/git-commit/
Other..
