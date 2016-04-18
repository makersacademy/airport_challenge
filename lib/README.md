Documentation
-------------
This airport software can do the following tasks:
- land/take off a plane when the weather is sunny
- prevent landing/take off when the weather is stormy
- has a default plane capacity, which can be overwritten
- won't land a parked plane or take off a flying plane

Instantiate new airport and plane objects: 
```
your_airport = Airport.new(100)
your_plane = Plane.new 
```

To land or depart a plane:
```
your_airport.land(your_plane)
your_airport.depart(your_plane)

```





Travis CI Status Badge
----------------------
![alt tag](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)

Authors
-------
Annemarie Köhler
