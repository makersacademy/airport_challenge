
    - Land Plane -
    - Write classes for Airport and Airplane.
    - Write airport test that expects Airport to respond to land function.
    - Write user story test that tells a plane to land and confirm that it has landed.


    - Take off Plane -
    - Define method for airplane taking off.
    - Write airport test that expect Airport to respond to take_off function.
    - Write user story test that tells an airplane to take off and confirm that it has taken off.  

    - Prevent landing when the airport is full -
    - define method for full?, making it so airplanes cannot land if the airport is full. 
    - initialize capacity 

    - Prevent landing when weather is stormy -
    - define method for stormy? 
    - raise error if airplane tries to land while stormy

    - Prevent take off when weather is stormy -
    - raise error when airplane tries to take off while weather is stormy
    - plane only takes off while sunny. 


    COVERAGE: 97.78%  -- program not running as intended. Errors are not raised when at full capacity or while trying to land while weather is story. Not sure what I am missing. 
    
