This program emulates a working airport. It has the functionality to land planes and let planes take off, and responds to changes in weather.

Classes<br/>
  - Airport<br/>
   Methods that work on airport<br/>
    - capacity<br/>
      When a new airport is made, you can pass in the capacity of the airport.
      If no capacity is passed in, it will default to a default capacity. Calling the capacity method on an airport will return the capacity.<br/>
    - land<br/>
      When you land a plane, you need to pass in the plane as an argument.
      The method will then check to see if the airport is full, if the weather is stormy, and whether the plane is already in the airport.
      If none of those are true, it will land the plane<br/>
    - take_off<br/>
      You can pass in a specific plane to take off. If you don't, the last plane to land will take off. 
      When take_off is called, first the method will check if it is stormy, if the airport is empty, and whether the plane you're asking for is already flying.
      If none of those are true, the plane will take off and start flying.<br/>
     - generate_number<br/>
      Generate number is used in the weather method, and returns a random number from 0-9, inclusive<br/>
     - weather<br/>
      The weather method uses the generate_number method to determine whether it is stormy (0-1), or sunny (2-9)<br/>
  - Plane<br/>
    When a plane is created, it is already flying<br/>
    Methods that work on plane:<br/>
      - stops_flying<br/>
        This makes flying? false.<br/>
      - starts_flying<br/>
        This makes flying? true.<br/>
      - flying?<br/>
        This allows you to check whether flying is true or false.<br/>
    
      