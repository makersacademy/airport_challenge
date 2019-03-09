# User stories and feature tests

> As an air traffic controller  
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport 

```
> airport = Airport.new
=> #<Airport:0x000....>
> plane = Plane.new
=> #<Plane:0x000...>
> plane.land_at airport
Plane landed!
=> #<Plane:0x000...>
```

---

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

> As an air traffic controller  
> To ensure safety  
> I want to prevent takeoff when weather is stormy  

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy  

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full  

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate  