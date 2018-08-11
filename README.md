Airport Challenge
=================

Create an airport and land planes there. 

#### Creating an airport
You can create an airport with a default capacity of 35 without passing any arguments:
```
heathrow = Airport.new
```
Or you can specify a capacity by passing in an integer as an argument, like so:
```
heathrow = Airport.new(200)
```

#### Landing and takeoff
Planes can land at an airport by using the `land` method and specifying a flight number:
```
heathrow.land("BA123")
```

Likewise, a plane can takeoff from an airport using `takeoff` and specifying a flight number:
```
heathrow.takeoff("BA123")
```

Landing and takeoff can only be carried out when the weather isn't stormy. 
