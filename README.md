Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
How to use
-----
➜  airport_challenge git:(master) irb --simple-prompt
>> Dir["./lib/*.rb"].each {|file| require file}
=> ["./lib/aeroplane.rb", "./lib/airport.rb", "./lib/weather.rb"]
>> Gatwick = Airport.new
=> #<Airport:0x007fbcd00b1820 @planes=[], @weather=#<Weather:0x007fbcd00b17f8>, @capacity=10>
>> britishairways = Aeroplane.new
=> #<Aeroplane:0x007fbcd00aa3b8 @landed=false>
>> Gatwick.land(britishairways)
RuntimeError: Plane cannot land due to storm!
	from /Users/lucyborthwick/Desktop/Projects/week-1/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):4
	from /Users/lucyborthwick/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
>> Gatwick.land(britishairways)
=> [#<Aeroplane:0x007fbcd00aa3b8 @landed=true>]
