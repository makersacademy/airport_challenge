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
`@capacity` is the total capacity permitted for Plane objects. It defaults to Airport::DEFAULT_CAPACITY.

```
2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007fc42719bc78 @capacity=4, @hangar=[]>
2.5.0 :005 > airport = Airport.new(3)
 => #<Airport:0x00007fc427132d18 @capacity=3, @hangar=[]>
```
