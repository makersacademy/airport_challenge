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
