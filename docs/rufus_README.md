AIRPORT CHALLENGE
This is Rufus Raghunath's week 01 weekend challenge
Makers Academy
Jan 2016

---------------------------------------------------

ABOUT THE CHALLENGE:
The task is to write a program in Ruby that allows planes to land at and takeoff from airports, dependent on the weather. We were to improve our grasp of TDD by using preemptive RSpec testing.


MY APPROACH:
I started out by going through the user stories and writing out the classes necessary to satisfy the task requirements, as well as the actions those classes would need to perform (see ./docs/user_stories.md). This allowed me to have a solid overview of the bare-bones functionality this project required before writing any code. (Similar to how we wrote out the nouns and verbs for the user stories in Boris Bikes, except more focused on the nouns and verbs actually relevant to the code). The next step was simply to set up doc and spec files for each class and then go through the actions necessary to have a functioning airport step by step, writing tests for each action and then making the tests pass.

While it was obvious to make separate classes for Plane and Airport, Weather was a bit more ambiguous. Originally I wanted another class, but since it would make no sense to have to call Weather.new I decided to make it into a module, so that any objects needing to refer to it could call on its code without there having to be a “weather object”. Of course, I could have just made a .weather method for Airport, but it didn’t make conceptual sense to me to have the weather exist only in the context of airports. Just as real airports are dependent on external weather conditions, my Airport objects are dependent on an external module. Plus, if we were to extend this virtual world any other classes that have to refer to the weather could simply include the module, too.


IRB SESSION EXAMPLE:
```
2.2.3 :006 > heather = Airport.new
 => #<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[]> 
2.2.3 :007 > harry = Plane.new
 => #<Plane:0x007fceb1877c60> 
2.2.3 :008 > rachel = Plane.new
 => #<Plane:0x007fceb186ca68> 
2.2.3 :009 > chris = Plane.new
 => #<Plane:0x007fceb185ead0> 
2.2.3 :010 > harry.land heather
 => "Plane has landed successfully" 
2.2.3 :011 > rachel.land heather
 => "Plane has landed successfully" 
2.2.3 :012 > chris.land heather
 => "Plane has landed successfully" 
2.2.3 :013 > arnold = Airport.new 2
 => #<Airport:0x007fceb1824420 @capacity=2, @landing_strip=[]> 
2.2.3 :014 > heather.landing_strip
 => [#<Plane:0x007fceb1877c60 @airport=#<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[#<Plane:0x007fceb1877c60 ...>, #<Plane:0x007fceb186ca68 @airport=#<Airport:0x007fceb1887980 ...>>, #<Plane:0x007fceb185ead0 @airport=#<Airport:0x007fceb1887980 ...>>]>>, #<Plane:0x007fceb186ca68 @airport=#<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[#<Plane:0x007fceb1877c60 @airport=#<Airport:0x007fceb1887980 ...>>, #<Plane:0x007fceb186ca68 ...>, #<Plane:0x007fceb185ead0 @airport=#<Airport:0x007fceb1887980 ...>>]>>, #<Plane:0x007fceb185ead0 @airport=#<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[#<Plane:0x007fceb1877c60 @airport=#<Airport:0x007fceb1887980 ...>>, #<Plane:0x007fceb186ca68 @airport=#<Airport:0x007fceb1887980 ...>>, #<Plane:0x007fceb185ead0 ...>]>>] 
2.2.3 :015 > arnold.landing_strip
 => [] 
2.2.3 :016 > harry.takeoff
 => "Plane has taken off successfully" 
2.2.3 :017 > harry.land arnold
 => "Plane has landed successfully" 
2.2.3 :018 > heather.landing_strip
 => [#<Plane:0x007fceb186ca68 @airport=#<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[#<Plane:0x007fceb186ca68 ...>, #<Plane:0x007fceb185ead0 @airport=#<Airport:0x007fceb1887980 ...>>]>>, #<Plane:0x007fceb185ead0 @airport=#<Airport:0x007fceb1887980 @capacity=100, @landing_strip=[#<Plane:0x007fceb186ca68 @airport=#<Airport:0x007fceb1887980 ...>>, #<Plane:0x007fceb185ead0 ...>]>>] 
2.2.3 :019 > arnold.landing_strip
 => [#<Plane:0x007fceb1877c60 @airport=#<Airport:0x007fceb1824420 @capacity=2, @landing_strip=[#<Plane:0x007fceb1877c60 ...>]>>] 
2.2.3 :020 > rachel.takeoff
 => "Plane has taken off successfully" 
2.2.3 :021 > rachel.land arnold
 => "Plane has landed successfully" 
2.2.3 :022 > chris.takeoff
 => "Plane has taken off successfully" 
2.2.3 :023 > chris.land arnold
RuntimeError: Plane unable to land because landing strip at target airport is full
	from /Users/dimdim/Dropbox/Projects/airport_challenge/lib/plane.rb:5:in `land'
	from (irb):23
	from /Users/dimdim/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :024 > 
```
