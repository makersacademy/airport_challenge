##Domain model

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
 Weather            | 20% chances is stormy                      



Edge cases:
should prevent a plane to land
