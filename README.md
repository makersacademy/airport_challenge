Upon initializing an instance of an airport, you can add the amount of plane instances that are within the airport.

These plane instances will automatically be put into the hangar and their @grounded value will be set to true.

When planes are created, they are automatically in the sky unless I create them inside an airport instance in which case they will be grounded.

An airport cannot lose a plane it does not have, but it can receive one it does not have therefore planes should be automically in flight upon creation unless they are created within an airport instance. 

Planes can only take off from airports they are in, and they cannot take off when they are already in the sky. 

Occasional extreme and stormy weather can occur when the weather instance variable in each airport is a 9 or 10. In this case, planes will not be able to take off or land. 

Whilst I had an idea of creating a seperate class for weather, I believed that the weather at each airport is an attribute of the airport itself. Meaning that different airports will have different weather. 

I have included a brief transcript below which shows the code in action. 

 => #<Plane:0x00000001550dc360 @grounded=false> 
 => #<Plane:0x000000013700c110 @grounded=false> 
 => #<Airport:0x00000001552a2398 @capacity=15, @hangar=[], @weather=1> 
3.0.2 :006 > lisbon = Airport.new(plane1)
 => #<Airport:0x000000013600ca58 @capacity=15, @hangar=[#<Plane:0x00000001550dc360 @grounded=true>], @weather=3> 
3.0.2 :007 > lisbon.lose(plane2)
/Users/emmanuel/Projects/airport_challenge/lib/airport.rb:25:in `lose': #<Plane:0x000000013700c110> is not at this airport (RuntimeError)
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :008 > london.receive(plane2)
 => [#<Plane:0x000000013700c110 @grounded=true>] 
3.0.2 :009 > london.weather = 9
 => 9 
3.0.2 :010 > london.lose(plane2)
/Users/emmanuel/Projects/airport_challenge/lib/airport.rb:27:in `lose': The weather is too stormy to take off (RuntimeError)
        from (irb):10:in `<main>'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'