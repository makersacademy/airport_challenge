First, I created an outline of what I wanted to do. Then I took the user stories in turn to make sure they are all met.
I used TDD ensuring not to miss edge cases and they all pass.

I focused on the airport as the main class as it can have many planes at once while a plane can only be at one airport.
Due the the scale of this project, I didn't think it was neccessary to add indentification codes for the airport.
```
Use in irb:
2.7.0 :002 > port = Airport.new
2.7.0 :003 > plane = Airplane.new
2.7.0 :004 > port.landPlane(plane)
2.7.0 :005 > port.landPlane(plane)
RuntimeError (already landed)
2.7.0 :007 > port.takeOff
2.7.0 :008 > port.changeWeather(:stormy)
2.7.0 :009 > port.landPlane(plane)
RuntimeError (Bad weather)
```


