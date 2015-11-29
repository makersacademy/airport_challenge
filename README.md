Airport Challenge
=================

What is this?
---------

This is the first of 12 weekend challenges during my course at Makers Academy.
Find original repo and challenge description [here](https://github.com/makersacademy/airport_challenge).

Domain model
--------------------------

Objects         |    Messages                                                             
-------------------| ------------------------------------------------------------------------
Plane              | is_flying                                          
AirTrafficControl  | lands a plane with confirm                                          
                | takes off a plane from airport with confirm  , and it is removed from airport
                | fails landing if weather is stormy                                      
                | fails take off if weather is stormy                                    
                | fails take off if airport is full                                   
Weather            | 20% chances is stormy                      
Airport            | Has default capacity, but it can be overwritten                           
                | Has planes                                                               
                | Has name                                                               
                 
