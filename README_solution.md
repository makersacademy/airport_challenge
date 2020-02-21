This program emulates a working airport. It has the functionality to land planes and let planes take off, and responds to changes in weather.

Classes
  - Airport
    Methods that work on airport
      - capacity
        When a new airport is made, you can pass in the capacity of the airport.
        If no capacity is passed in, it will default to a default capacity. Calling the capacity method on an airport will return the capacity.
      - land
        When you land a plane, you need to pass in the plane as an argument.
        The method will then check to see if the airport is full, and if the weather is stormy.
        If neither are true, it will land the plane
      - take_off
        You can pass in a specific plane to take off. If you don't, the last plane to land will take off. 
        When take_off is called, first the method will check if it is stormy, if the airport is empty, and whether the plane you're asking for is already flying.
        If none of those are true, the plane will take off and start flying.
      - generate_number
        Generate number is used in the weather method, and returns a random number from 0-9, inclusive
      - weather
        The weather method uses the generate_number method to determine whether it is stormy (0-1), or sunny (2-9).
    Private methods
      The method full? has been defined as a private method, as it's necessary to run the airport, but do not need to be called by users.
  - Plane
    
      