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

# How to use it

'airport.rb', 'weather.rb', and 'plane.rb' are all required in order for the application to function.


## Plane Objects

Plane objects have one instance variable `@name`. <br/>
`@name` defaults to a random number, but can be set on instantiation:

```
2.5.0 :006 > plane = Plane.new
 => #<Plane:0x00007fc42712f028 @name="Plane 21">
2.5.0 :007 > plane = Plane.new("MH372")
 => #<Plane:0x00007fc427125f28 @name="MH372">
 ```

## Weather Objects

Weather objects have one method: stormy <br/>
Upon instantiation, Weather generates a randomised number which results in stormy either evaluating `true` or `false`

```
2.5.0 :008 > weather = Weather.new.stormy
 => false
2.5.0 :010 > weather = Weather.new.stormy
 => true
```

## Airport Objects

An airport object contains two instance variables: <br/>
`@hangar` is an empty array which is used to store Plane objects. <br/>
`@capacity` is the total capacity permitted for Plane objects. It defaults to Airport::DEFAULT_CAPACITY, and can be set on instantiation.

```
2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007fc42719bc78 @capacity=4, @hangar=[]>
2.5.0 :005 > airport = Airport.new(3)
 => #<Airport:0x00007fc427132d18 @capacity=3, @hangar=[]>
```

Airport objects have 2 methods: #land and #takeoff. <br/>

### #land

#land takes a Plane object as an argument. The Plane object is added to @hangar, and confirmation message is outputted.

```
2.5.0 :012 > plane = Plane.new
 => #<Plane:0x00007fc4278e44f8 @name="Plane 62">
2.5.0 :013 > airport.land(plane)
Plane 62 has landed.
The hangar contains Plane 62.

2.5.0 :014 > airport
 => #<Airport:0x00007fc427901f30 @capacity=4, @hangar=[#<Plane:0x00007fc4278e44f8 @name="Plane 62">]>
```

If a Plane object is already present in @hangar, #land will raise an error.

```
2.5.0 :015 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/andres/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):15
        1: from /Users/andres/Projects/airport_challenge/lib/airport.rb:18:in `land'
RuntimeError (Plane 62 has already landed!)
```

