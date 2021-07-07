First 3 storys are done just need to fix the Rspec errors on the current story.

<!-- Jacks-Air:airport_challenge jack$ irb -->
2.6.0 :001 > require './lib/airport'
 => true 
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007fac0f0dc1a0 @capacity=3, @planes=[]> 
2.6.0 :003 > plane = Plane.new
 => #<Plane:0x00007fac0e021158> 
2.6.0 :004 > plane = Plane.new
 => #<Plane:0x00007fac0f07f0e0> 
2.6.0 :005 > plane = Plane.new
 => #<Plane:0x00007fac0f078ec0> 
2.6.0 :006 > plane = Plane.new
 => #<Plane:0x00007fac0e81f080> 
2.6.0 :007 > airport.land(:plane)
 => [:plane] 
2.6.0 :008 > airport.land(:plane)
 => [:plane, :plane] 
2.6.0 :009 > airport.take_off(:plane)
Plane has taken off 

Fix up the Rpsec errors

Then write out the come up with a plan for the next two story's 

prevert Take_off when WEATHER is STORMY
prevent LAND when WEATHER is STORMY

I will need to look into Ramdom Generator for this to set the weather so two weather conditions sun or rain give it a 1/3 or 1/4 chance of Rain in doing so this will prevent the methods

In the Test i will need to use stub to orverride the random weather conditions to ensure consistent test behaviour, so next step would be to research stub and random number generates 

after this i would need to look into edge classes to ensure planes only take off from airports they in as well as planes flying already cant take off or be in the airport


