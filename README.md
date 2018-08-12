Airport Challenge
=================

A program for air traffic controllers to control the flow of planes at an airport. Planes can take off and land provided that the weather is sunny; occasionally it may be stormy, in which case no planes can land or take off.  

System Features  
-----
- Instructs planes to land at airport
- Instructs planes to take off from airport, and confirm plane is no longer at airport
- Prevents takeoff when weather is stormy
- Prevents landing when weather is stormy
- Prevents landing when airport is full
- Default airport capacity can be overridden as appropriate (per airport)  

Design & Assumptions
-----
The program is designed to be run by Air Traffic Controllers. Therefore the methods ``.land`` and ``.takeoff`` are called on ``Airport``, as opposed to ``Plane``. If the program was intended for Pilots, these methods would be called on ``Plane``.  

The weather status is checked via the private method ``.weather_bad?`` whenever ``.takeoff`` or ``.land`` are called, as opposed to having the weather set at the startup of the program (e.g. at the start of each day) - because weather is changeable.  

The initial approach to setting the method was to use ``.sample`` on an array of the given weather conditions:

```
def report
  ["sunny", "stormy"].sample
end
```

A random number generator could also be used to select an element by its index:  

```  
def report
  ["sunny", "stormy"][rand(1)]
end
```  

These methods allow flexibility for easily adding new wether conditions, e.g "raining" or "snowing".  

However both methods assume an equal probability of all weather types. The original specification says that stormy weather is "occasional", implying a lower probability.  

The ``.report`` method was refactored to return an (arbitrary) 1 in 5 probabilty of stormy weather:  

```
def report
  case rand(6)
    when 1 then "stormy"
    else "sunny"
  end
end
```
