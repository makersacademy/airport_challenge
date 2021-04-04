# Airport Challange

## Task
Create a mock software to control flow of planes at an air port using users stories.

## User Stories
> As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
>
### Feature implementation
```irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007fc95a0e6d18>
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fc95a0ef918>
2.6.5 :003 > plane.land(airport)
 => #<Airport:0x00007fc95a0e6d18>
```

>As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
>
### Feature implementation
```irb
2.6.5 :001 > plane = Plane.new
 => #<Plane:0x00007fb9b28da6f8 @at_airport=true>
2.6.5 :002 > plane.in_air?
 => false
2.6.5 :003 > plane.take_off
 => nil
2.6.5 :004 > plane.in_air?
 => true
 ```

 >As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
>

```irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007ff1a1869af8>
2.6.5 :002 > plane1 = Plane.new
 => #<Plane:0x00007ff1a1870c40>
2.6.5 :003 > plane2 = Plane.new
 => #<Plane:0x00007ff1a3149af0>
2.6.5 :004 > plane1.land(airport)
 => #<Plane:0x00007ff1a1870c40>
2.6.5 :005 > plane2.land(airport)
Traceback (most recent call last):
        5: from /Users/apple/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/apple/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/apple/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from /Users/apple/Desktop/Projects/airport_challenge/lib/plane.rb:4:in `land'
RuntimeError (airport full)
```

>As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
>

```irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007fe0db938d98 @hanger=[], @capacity=1>
2.6.5 :002 > airport.change_capacity(3)
 => 3
2.6.5 :003 > 3.times { Plane.new.land(airport) }
 => 3
 ```