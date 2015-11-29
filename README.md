Airport Challenge
=================

What is this
---------

This is the first of 12 weekend challenges during my course at Makers Academy.
The original repo and readme file are [here](https://github.com/makersacademy/airport_challenge).

Domain model for Solution 1
--------------------------

    Objects         |    Messages                                                             
 -------------------| ------------------------------------------------------------------------
 Plane              | is_flying
                    | lands at destination airport                                          
                    | takes off from airport                                                                           
 Airport            | Has default capacity, but it can be overwritten                           
                    | Has planes                                                               
                    | Has name                                                               
                    | prevents landing if weather at airport is bad                                      
                    | prevents take off if weather at airport is bad                                    
                    | prevents landing if airport is full  
 Weather            | 20% chances is bad                      
