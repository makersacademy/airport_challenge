Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Summary
=================

This programme creates an airport that can:

1. Land planes
2. Take planes off
3. Have variable and default capacity for planes
4. Report on plane status
5. Prevent landing and take-off in stormy weather

Project architecture
=================
Each class (e.g. Airport) is stored in its own ruby file in the ./lib directory. Each lib file has a corresponding spec file for testing. Production code is test-driven.

Feature testing
=================
```
>> airport = Airport.new
=> #<Airport:0x007fac81a5bb78 @capacity=20, @planes=[]>
>> plane = Plane.new
=> #<Plane:0x007fac819f97e8>
>> airport.land(plane)
=> [#<Plane:0x007fac819f97e8 @status="Landed">]
>> airport
=> #<Airport:0x007fac81a5bb78
 @capacity=20,
 @planes=[#<Plane:0x007fac819f97e8 @status="Landed">]>
>> airport.take_off
=> "Taken off"
>> airport
=> #<Airport:0x007fac81a5bb78 @capacity=20, @planes=[]>
```
