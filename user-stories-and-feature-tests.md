# User stories and feature tests

> As an air traffic controller  
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport 

```
> airport = Airport.new(WeatherForecaster.new)
 => #<Airport:0x000....>
> plane = Plane.new
 => #<Plane:0x000...>
> airport.land plane
☀️ Plane landed! ☀️
 => #<Airport:0x000...>
> airport.planes.include? plane
 => true
```

---

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
# follow above steps to initialise an airport and a plane, and land the plane at the airport
> airport.clear_for_takeoff plane
☀️ Up, up and away! ☀️
 => #<Airport:0x000...>
> airport.planes.include? plane
 => false
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent takeoff when weather is stormy  

```
# follow above steps to initialise an airport and a plane, and land the plane at the airport
# then, if the weather is bad...
> airport.clear_for_takeoff plane
⛈ Sorry, all aircraft grounded until further notice. ⛈
 => #<Airport:0x000...>
> airport.planes.include? plane
 => true
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy  

```
# follow above steps to initialise an airport and a plane
# then, if the weather is bad...
> airport.land plane
⛈ Sorry, too dangerous to land. ⛈
 => #<Airport:0x000...>
> airport.planes.include? plane
 => false
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full  

```
> airport = Airport.new(double(:weather, :status, "️️️☀️"))
> 10.times { airport.land Plane.new }
(10 x) "☀️ Plane landed! ☀️"
> plane = Plane.new
> airport.land plane
"Sorry, no more room!"
 => #<Airport: 0x000...>
> airport.planes.include? plane
 => false
```

___

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate  