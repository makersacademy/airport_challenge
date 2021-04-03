# Airport Challange

## Task
Create a mock software to control flow of planes at an air port using users stories.

## Stories
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
