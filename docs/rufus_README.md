<b>AIRPORT CHALLENGE</b><br>
This is Rufus Raghunath's week 01 weekend challenge<br>
Makers Academy<br>
Jan 2016<br>
Travis CI: [![Build Status](https://travis-ci.org/rufusraghunath/airport_challenge.svg?branch=master)](https://travis-ci.org/rufusraghunath/airport_challenge)

---------------------------------------------------

<b>ABOUT THE CHALLENGE:</b><br>
The task is to write a program in Ruby that allows planes to land at and takeoff from airports, dependent on the weather. We were to improve our grasp of TDD by using preemptive RSpec testing.


<b>MY APPROACH:</b><br>
I started out by going through the user stories and writing out the classes necessary to satisfy the task requirements, as well as the actions those classes would need to perform (see ```./docs/user_stories.md```). This allowed me to have a solid overview of the bare-bones functionality this project required before writing any code. (Similar to how we wrote out the nouns and verbs for the user stories in Boris Bikes, except more focused on the nouns and verbs actually relevant to the code). The next step was simply to set up doc and spec files for each class and then go through the actions necessary to have a functioning airport step by step, writing tests for each action and then making the tests pass.

While it was obvious to make separate classes for ```Plane``` and ```Airport```, ```Weather``` was a bit more ambiguous. Originally I wanted another class, but since it would make no sense to have to call ```Weather.new``` I decided to make it into a module, so that any objects needing to refer to it could call on its code without there having to be a “weather object”. Of course, I could have just made a ```.weather``` method for ```Airport```, but it didn’t make conceptual sense to me to have the weather exist only in the context of airports. Just as real airports are dependent on external weather conditions, my ```Airport``` objects are dependent on an external module. Plus, if we were to extend this virtual world any other classes that have to refer to the weather could simply include the module, too.


<b>IRB SESSION EXAMPLE:</b><br>
```
2.2.3 :006 > arnold = Airport.new
 => #<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[]> 
2.2.3 :007 > harry = Plane.new
 => #<Plane:0x007f8fb11a1010> 
2.2.3 :008 > scott = Plane.new
 => #<Plane:0x007f8fb08b3048> 
2.2.3 :009 > chris = Plane.new
 => #<Plane:0x007f8fb08ab780> 
2.2.3 :010 > harry.land arnold
RuntimeError: Plane cannot complete action: bad weather
	from /Users/dimdim/Dropbox/Projects/airport_challenge/lib/plane.rb:5:in `land'
	from (irb):10
	from /Users/dimdim/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :011 > harry.land arnold
 => "Plane has landed successfully" 
2.2.3 :012 > scott.land arnold
 => "Plane has landed successfully" 
2.2.3 :013 > chris.land arnold
 => "Plane has landed successfully" 
2.2.3 :014 > arnold.landing_strip
 => [#<Plane:0x007f8fb11a1010 @airport=#<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[#<Plane:0x007f8fb11a1010 ...>, #<Plane:0x007f8fb08b3048 @airport=#<Airport:0x007f8fb11b1320 ...>>, #<Plane:0x007f8fb08ab780 @airport=#<Airport:0x007f8fb11b1320 ...>>]>>, #<Plane:0x007f8fb08b3048 @airport=#<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[#<Plane:0x007f8fb11a1010 @airport=#<Airport:0x007f8fb11b1320 ...>>, #<Plane:0x007f8fb08b3048 ...>, #<Plane:0x007f8fb08ab780 @airport=#<Airport:0x007f8fb11b1320 ...>>]>>, #<Plane:0x007f8fb08ab780 @airport=#<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[#<Plane:0x007f8fb11a1010 @airport=#<Airport:0x007f8fb11b1320 ...>>, #<Plane:0x007f8fb08b3048 @airport=#<Airport:0x007f8fb11b1320 ...>>, #<Plane:0x007f8fb08ab780 ...>]>>] 
2.2.3 :015 > rachel = Airport.new 1
 => #<Airport:0x007f8fb1152050 @capacity=1, @landing_strip=[]> 
2.2.3 :016 > harry.takeoff
 => "Plane has taken off successfully" 
2.2.3 :017 > harry.land rachel
 => "Plane has landed successfully" 
2.2.3 :018 > arnold.landing_strip
 => [#<Plane:0x007f8fb08b3048 @airport=#<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[#<Plane:0x007f8fb08b3048 ...>, #<Plane:0x007f8fb08ab780 @airport=#<Airport:0x007f8fb11b1320 ...>>]>>, #<Plane:0x007f8fb08ab780 @airport=#<Airport:0x007f8fb11b1320 @capacity=100, @landing_strip=[#<Plane:0x007f8fb08b3048 @airport=#<Airport:0x007f8fb11b1320 ...>>, #<Plane:0x007f8fb08ab780 ...>]>>] 
2.2.3 :019 > rachel.landing_strip
 => [#<Plane:0x007f8fb11a1010 @airport=#<Airport:0x007f8fb1152050 @capacity=1, @landing_strip=[#<Plane:0x007f8fb11a1010 ...>]>>] 
2.2.3 :020 > scott.takeoff
RuntimeError: Plane cannot complete action: bad weather
	from /Users/dimdim/Dropbox/Projects/airport_challenge/lib/plane.rb:15:in `takeoff'
	from (irb):20
	from /Users/dimdim/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :021 > scott.takeoff
 => "Plane has taken off successfully" 
2.2.3 :022 > scott.land rachel
RuntimeError: Plane cannot complete action: landing strip full
	from /Users/dimdim/Dropbox/Projects/airport_challenge/lib/plane.rb:6:in `land'
	from (irb):22
	from /Users/dimdim/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
