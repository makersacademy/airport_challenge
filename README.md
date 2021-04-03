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
2.6.5 :001 > plane = Plane.new
 => #<Plane:0x00007f807d8603f8>
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007f807d87b270>
2.6.5 :003 > plane.land(airport)
 => #<Airport:0x00007f807d87b270>
2.6.5 :004 >
```
