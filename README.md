Ed's Airport Challenge
=================

```
                               ._                             
                              |* ;                            
            `*-.              |"":                            
             \  \             |""                             
              .  \            |   :                           
              `   \           |                               
               \   \          |    ;               +.         
                .   \         |                   *._`-.      
                `    \        |     :          .-*'  `. `.    
                _\    \.__..--**--...L_   _.-*'      .'`*'    
               /  `*-._\   -.       .-*"*+._       .'         
              :        ``*-._*.     \      _J.   .'           
          .-*'`*-.       ;     `.    \    /   `.'             
      .-*'  _.-*'.     .-'       `-.  `-.:   _.'`-.           
   +*' _.-*'      `..-'             `*-. `**'      `-.        
    `*'          .-'      ._            `*-._         `.      
              .-'         `.`-.____..+-**""'         .*"`.    
         ._.-'          _.-*'':$$$;._$              /     `.  
      .-'  `.      _.-*' `*-.__T$P   `"**--..__    :        `.
.'..-'       \_.-*'                            `"**--..___.-*'
`. `.    _.-*'                                                
  `. `:*'                                                     
    `. `.                                                     
      `*

```

Approach
---------



Program
---------

* Allows the creation of airports with varying capacity hangars
* Allows the creation of unique planes
* Airports can allow the landing and take off of unique planes
* If an airport is full, i.e. its hangar is at its full capacity, it will not allow further planes to land
* The program simulates variable weather; if it's stormy, airports will temporarily close
allowing no take off or landing of planes

Instructions
---------
The program can be run in the terminal/irb, and requires the following files;

airport.rb

plane.rb

weather.rb

* To create a new airport
``` Airport.new(capacity)```
* To create a new plane
```Plane.new```
* To land a plane at an airport
```airport.land(plane)```
* To take off a plane from an airport
```airport.take_off(plane)```
* To check which planes are grounded at an airport
```airport.hangar```

e.g.

```
2.5.0 :005 > airport = Airport.new
 => #<Airport:0x00007fe8c4108560 @hangar=[], @capacity=1> 
2.5.0 :006 > plane = Plane.new
 => #<Plane:0x00007fe8c4100900 @grounded=false> 
2.5.0 :007 > airport.land(plane)
 => [#<Plane:0x00007fe8c4100900 @grounded=true>] 
2.5.0 :008 > airport.hangar
 => [#<Plane:0x00007fe8c4100900 @grounded=true>] 
2.5.0 :009 > airport.take_off(plane)
 => #<Plane:0x00007fe8c4100900 @grounded=false> 
2.5.0 :010 > 
```
