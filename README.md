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

My solution
---------

I have three classes - Airport, Airplane and Weather

**Weather**
  * has an attribute ```condition```, which can either be ```"Sunny"``` or ```"Stormy"``` initialised at random on creation

**Airplane**
  * has attribute ```landed``` which is true or false depending on whether the plane is flying or not. Instantiates as ```landed = true ```
  * has two methods ```take_off!``` and ```land!``` that set landed to false and true respectively
  * has two accessor methods for landed ```landed?``` that returns landed and ```flying?``` that returns ```not landed```

**Airport**
  * has an attribute ```hangar``` that stores ```Airplane``` objects
  * has an attribute ```weather``` that has a ```Weather``` object
  * has an attribute ```capacity``` that is the maximum number of plane objects the airport can hold. Defaults to 30.
  * has getter methods for all these three attributes
  * has a ```land``` method that takes a plane object as an argument. If the weather is fair, ie ```aiport.weather.condition == "Sunny"``` and the hangar ```NOT full?``` it will accept the aircraft as landing, and change its ```landed``` attribute to ```true``` and push it to the ```hangar```
  * has a ```taxi``` method that takes a plane object as an argument, and if the weather is fair, will remove that plane from the hangar and set its landed attribute to ```false```

  [![Build Status](https://travis-ci.org/GeorgeSeeger/airport_challenge.svg?branch=master)](https://travis-ci.org/GeorgeSeeger/airport_challenge)
