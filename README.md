# Airport Challenge

## Approach

I started with each individual user story and wrote a test, then wrote the code to pass the test.

After all five user stories completed and coded, I looked at the "edge cases" and wrote tests for them, then wrote the simplest code to pass the test.

I have refactored where I can - lines 41 and 48 in plane_spec.rb are repeated but I couldn't figoure out a way to avoid the repetition. I tried using `before` but created unexpected errors so I felt the simplest solution was to leave the repetition in (within current time frame, at least). I used `let` to avoid other repetition when setting up the tests and used `allow` to take account of random weather.

Methods are short and do one thing only. I had to make certain assumptions as unable to ask further questions to the client. An airport is a big place and a plane can be in various different areas of the airport, eg the plane could be on the runway, at the terminal or in a hangar.

All tests pass, and have 100% coverage and rubocop is happy.

I have not wrote the bonus "feature test" but the below example shows how it might be used:

## Example

Running irb and requiring plane.rb (which itself requires airport.rb):
```
3.0.2 :003 > require './plane.rb'
 => true 
```

Create a new plane object and a new airport object:
```
3.0.2 :004 > plane = Plane.new
 => #<Plane:0x00007fc886ac6628 @landed=false> 
3.0.2 :005 > airport = Airport.new
 => #<Airport:0x00007fc8869c67c8 @hangar=[]> 
```

Attempt to land the plane but fails as the weather is stormy:
```
3.0.2 :006 > plane.land(airport)
 => "Unable to land. Weather is stormy" 
```

Attempt a second time and succeeds:
```
3.0.2 :007 > plane.land(airport)
 => #<Airport:0x00007fc8869c67c8 @hangar=[#<Plane:0x00007fc886ac6628 @landed=true>]> 
```

Try to land the plane again (which should be impossible as its already landed) and get the expected error:
```
3.0.2 :008 > plane.land(airport)
/Users/witchveil/Documents/Makers/Projects/airport_challenge/lib/plane.rb:12:in `land': Unable to land, plane is already landed (RuntimeError)
	from (irb):8:in `<main>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

Try to take off from a different airport and get the expexted error as plane is not in that airport:
```
3.0.2 :009 > plane.take_off(Airport.new)
/Users/witchveil/Documents/Makers/Projects/airport_challenge/lib/plane.rb:22:in `take_off': Unable to take-off. Plane not in that airport (RuntimeError)
	from (irb):9:in `<main>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

Try to take off from the correct airport but fails as the weather is stormy:
```
3.0.2 :010 > plane.take_off(airport)
 => "Unable to take-off. Weather is stormy" 
```

Try again and the weather is clear so the plane is no longer in the airport:
```
3.0.2 :011 > plane.take_off(airport)
 => "#<Plane:0x00007fc886ac6628> is no longer in #<Airport:0x00007fc8869c67c8>" 
```

Finally, try and take off again and get the expected error as the plane has taken off previously:
```
3.0.2 :012 > plane.take_off(airport)
/Users/witchveil/Documents/Makers/Projects/airport_challenge/lib/plane.rb:21:in `take_off': Unable to take-off. Plane already flying (RuntimeError)
	from (irb):12:in `<main>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/witchveil/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

## Further thoughts

I often wondered which object was the most appropriate for which method. I originally planned the airport object to take the methods `land` and `take_off` however the user stories implied it should be the plane objects that should take those methods. Although its true that 'the plane lands at the airport' it should really be the airport that controls if the plane can land or take-off. Without being able to further question the 'client' I stuck to the user story to allow a user 'to instruct a plane to land at an airport.' This did result in me calling `airport.full?` from the plane object when the `full?` method could have been kept as a private method within `airport`

Similarly, checking the weather is done with a method within `airport` but is called from `plane` and seems counter-intuitive but as it stands - and without being able to further query the client or get a better understanding of the user needs - the tests pass and the script meets the need of controlloing the flow of planes at an airport. As a further thought, checking the weather may be more likely to be done with an API.

## Task

Original task description included below for reference....


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
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
