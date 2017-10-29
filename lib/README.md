# Airport Challenge

## Description

This project creates a software that can be used for airports to manage the landing and taking-off of planes depending on airport capacity and weather. It also takes into account that new planes can be built and moved into airports by land.

## Workflow

The workflow establishes 3 classes: Airport, Plane and Weather. The first two provide the framework to allow planes from moving around in between airports whereas the last one has as it's only function to establish the weather.

In order to use our project we will need to:

1. Create an airport which will start empty and with the default capacity of 20 planes (this can be adjusted by passing an argument when creating the airport instance).

``` 
[4] pry(main)> heathrow=Airport.new
=> #<Airport:0x007fdbf3ac27f0 @capacity=20, @planes=[]>
```
2. Create a plane, when it's created, by default the plane is not flying.

```
[4] pry(main)> lufthansa=Plane.new
=> #<Plane:0x007fdc8f228c10 @flying=false>
```
3. We can now move the plane to the airport:

```
[8] pry(main)> lufthansa.move_to(heathrow)
```
4. We can now check if the plane is at the airport:

```
[9] pry(main)> heathrow.planes
=> [#<Plane:0x007fdc8f228c10 @flying=false>]
```
5. The plane can now attempt to take-off...

```
[10] pry(main)> lufthansa.attempt_take_off(heathrow)
RuntimeError: The weather is too stormy to take-off, wait for further instructions.!
```
6. Well, the weather is a random variable and although most of the times it's sunny, sometimes it is stormy and planes cannot take-off. Let's try again and see if the weather got better:

```
[11] pry(main)> lufthansa.attempt_take_off(heathrow)
=> true
```
7. The plane is now flying, let's check it's flying status:

```
[12] pry(main)> lufthansa.flying
=> true
```
8. We can confirm the plane is flying! Now let's try and have it land!

```
[13] pry(main)> lufthansa.attempt_land(heathrow)
```

9. Thankfully it wasn't stormy so the landing was successful. Let's see what is the flying status of the plane now:

```
[14] pry(main)> lufthansa.flying
=> false
```
10. This has now moved to false. We can now confirm that the plane was correctly stored at the airport

```
[15] pry(main)> heathrow.planes
=> [#<Plane:0x007fdc8f228c10 @flying=false>]
```
11. To finalize, let's try and move 20 planes to this airport. Lufthansa is already there and the capacity is 20 so this could cause a problem...

```
[16] pry(main)> 20.times {Plane.new.move_to(heathrow)}
RuntimeError: This airport is full.
```
12. Oh! Thankfully our code prevents for that. Let's check how many planes we have at Heathrow now:

```
18] pry(main)> heathrow.planes
=> [#<Plane:0x007fdc8f228c10 @flying=false>,
 #<Plane:0x007fdc9008db98 @flying=false>,
 #<Plane:0x007fdc9008db48 @flying=false>,
 #<Plane:0x007fdc9008db20 @flying=false>,
 #<Plane:0x007fdc9008daf8 @flying=false>,
 #<Plane:0x007fdc9008dad0 @flying=false>,
 #<Plane:0x007fdc9008da80 @flying=false>,
 #<Plane:0x007fdc9008da58 @flying=false>,
 #<Plane:0x007fdc9008da30 @flying=false>,
 #<Plane:0x007fdc9008da08 @flying=false>,
 #<Plane:0x007fdc9008d9b8 @flying=false>,
 #<Plane:0x007fdc9008d990 @flying=false>,
 #<Plane:0x007fdc9008d968 @flying=false>,
 #<Plane:0x007fdc9008d940 @flying=false>,
 #<Plane:0x007fdc9008d918 @flying=false>,
 #<Plane:0x007fdc9008d8f0 @flying=false>,
 #<Plane:0x007fdc9008d8c8 @flying=false>,
 #<Plane:0x007fdc9008d8a0 @flying=false>,
 #<Plane:0x007fdc9008d878 @flying=false>,
 #<Plane:0x007fdc9008d850 @flying=false>]
 ```
 13. And this is the basic workflow of the program. If you have further suggestions, I'd definitely appreciate it!



